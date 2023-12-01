Class {
	#name : #FamixModelComparator,
	#superclass : #Object,
	#instVars : [
		'strict'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #comparison }
FamixModelComparator >> ast: node1 acceptableDifferenceTo: node2 [
	"In non strict mode, some differences could be accepted"

	^false	
]

{ #category : #comparison }
FamixModelComparator >> ast: node1 acceptableDifferenceTo: node2 property: property [
	"returns nil if the difference is not acceptable
	 otherwise, must return  a block testing where the comparison process might resume"

	^nil
]

{ #category : #comparison }
FamixModelComparator >> ast: node1 differ: node2 [

	self strict ifTrue:  [ self differenceNotResumable ].

	(self ast: node1 acceptableDifferenceTo: node2)
		ifTrue:  [ self differenceResumableInParent ]
		ifFalse: [ self differenceNotResumable ]
]

{ #category : #comparison }
FamixModelComparator >> ast: node1 differ: node2 property: property [

	self strict ifTrue:  [ self differenceNotResumable ].

	(self ast: node1 acceptableDifferenceTo: node2 property: property)
		ifNil: [ self differenceNotResumable ]
		ifNotNil: [ :recovery | self differenceResumableOncondition: recovery ]
]

{ #category : #configuration }
FamixModelComparator >> beStrict [

	self strict: true
]

{ #category : #utilities }
FamixModelComparator >> childrenNodes: astNode [

	^OrderedCollection withAll:
		(astNode children sorted: [:a :b | a startPos <= b startPos])

]

{ #category : #comparison }
FamixModelComparator >> compare: node1 to: node2 [
	"check the two nodes have the same class
	 then check they have the same properties (attributes with primitive types)
	 then check recursively that they ahev the same sub-nodes
	
	  Upon error (differing asts) check a condition,
	  if it is true, do nothing (ie. resume comparison)
	  if it is false, resend the exception to be treated up in the calling stack"

	[
		self compareClasses: node1 to: node2.
		self compareProperties: node1 to: node2.
		self compareChildren: node1 to: node2
	]
	on: FamixModelComparatorRecoveryException 
	do: [ :exception |
		(exception condition value: node1 value: node2)
			ifFalse: [ exception pass ]
	]
]

{ #category : #comparison }
FamixModelComparator >> compareChildren: node1 to: node2 [
	"comparing the two lists of children may seem a bit complicate, but it is trying
	 to give more info when the children starts to differ
	For example comparing using #with:collect: gives very little information if the two lists
	differ in size"

	| size1 children1 size2 children2 |
	children1 := self childrenNodes: node1.
	children2 := self childrenNodes: node2.

	size1 := children1 size.
	size2 := children2 size.

	1 to: size1 do: [ :i |
		size2 < i
			ifTrue: [ self ast: (children1 at: i) differ: nil ]
			ifFalse: [ self compare: (children1 at: i) to: (children2 at: i) ] ].

	children2 size > children1 size ifTrue: [
		self ast: nil differ: (children2 at: children1 size + 1) ]
]

{ #category : #comparison }
FamixModelComparator >> compareClasses: node1 to: node2 [

	node1 class = node2 class ifFalse: [
		self ast: node1 differ: node2 ]
]

{ #category : #comparison }
FamixModelComparator >> compareProperties: node1 to: node2 [
	"compare the values of the 'properties' (attributes with primitive types) of the two nodes
	 since the two nodes should be the same class, they have the same properties"

	(node1 class mooseDescription allPrimitiveProperties)
		select: [ :property | self propertyToCompare: property ]
		thenDo:  [ :property || value1 value2 |
			value1 := node1 perform: property implementingSelector.
			value2 := node2 perform: property implementingSelector.

			(value1 = value2) ifFalse: [
			self ast: node1 differ: node2 property: property
		]
	]

]

{ #category : #exceptionbuilder }
FamixModelComparator >> differenceNotResumable [

	FamixModelComparatorRecoveryException signal: 'ASTs differ'
		
]

{ #category : #exceptionbuilder }
FamixModelComparator >> differenceResumableInParent [
	"raises an exception with a 'true' condition.
	 Process will resume in immediate parent"

	FamixModelComparatorRecoveryException new
		condition: [ :node1 : node2 | true ] ;
		signal: 'Overlooking difference in AST'
]

{ #category : #exceptionbuilder }
FamixModelComparator >> differenceResumableOncondition: aBlock [

	FamixModelComparatorRecoveryException new
		condition: aBlock ;
		signal: 'Overlooking difference in AST'
]

{ #category : #initialization }
FamixModelComparator >> initialize [

	super initialize.

	strict := false.
]

{ #category : #testing }
FamixModelComparator >> propertyToCompare: aFMProperty [
	"do not compare on derived (ie. computed) properties, only those with a stored value
	 do not compare on startPos/endPos as they are not meaningfull"

	aFMProperty isDerived ifTrue: [^false].
	(#(startPos endPos) includes: aFMProperty implementingSelector) ifTrue: [^false].
	^true
]

{ #category : #accessing }
FamixModelComparator >> strict [

	^ strict
]

{ #category : #accessing }
FamixModelComparator >> strict: anObject [

	strict := anObject
]

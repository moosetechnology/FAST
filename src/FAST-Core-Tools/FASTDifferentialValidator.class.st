"
I help checking the completness of FAST meta-model

## Process

For this:
- I go through all source files in a file hierarchy
- I extract a FAST model for each source file
- I re-export the source code from the FAST model
- I extract a new FAST model from the new code, and
- finally I compare the 2 FAST models (they should be the same)

## Caveat

This is not full-proof
- Some ASTs can be different and the code be ""the same"" for example `a + b + c` usually has different AST from `a + (b + c)`
- properties of nodes are currently not tested, so `a==b` is considered equal to `a!=b` because the #operator is not tested

## Configuration

There is a setting strict/not-strict (not by default) that allows to accept some minor AST differences (see above)
For this, a suitable `acceptableAST:differentFrom:` method should be defined that will receive 2 differeing nodes (one in each AST) and  must decide whether the difference is acceptable

There is a `skipPaths` list to allow skiping some paths in the main file directory
"
Class {
	#name : #FASTDifferentialValidator,
	#superclass : #Object,
	#instVars : [
		'skipPaths',
		'strict'
	],
	#category : #'FAST-Core-Tools'
}

{ #category : #comparison }
FASTDifferentialValidator >> ast: node1 acceptableDifferenceTo: node2 [
	"In non strict mode, some differences could be accepted"

	^false	
]

{ #category : #comparison }
FASTDifferentialValidator >> ast: node1 acceptableDifferenceTo: node2 property: property [

	^#(startPos endPos) includes: property
]

{ #category : #comparison }
FASTDifferentialValidator >> ast: node1 differ: node2 [

	self strict ifTrue:  [ Exception signal: 'ASTs differ' ].

	(self ast: node1 acceptableDifferenceTo: node2)
		ifTrue:  [
			('  ** difference in ignored, position in source: ' , node1 startPos asString)
				traceCr.
			Notification signal
		]
		ifFalse: [ Exception signal: 'ASTs differ' ]
]

{ #category : #comparison }
FASTDifferentialValidator >> ast: node1 differ: node2 property: property [

	(self ast: node1 acceptableDifferenceTo: node2 property: property)
		ifFalse: [ Exception signal: 'ASTs differ on property: ' , property implementingSelector ]
]

{ #category : #configuration }
FASTDifferentialValidator >> beStrict [

	self strict: true
]

{ #category : #utilities }
FASTDifferentialValidator >> childrenNodes: astNode [

	^OrderedCollection withAll:
		(astNode children sorted: [:a :b | a startPos <= b startPos])

]

{ #category : #comparison }
FASTDifferentialValidator >> compare: node1 to: node2 [
	"check the two nodes have the same class
	 then check they have the same properties (attributes with primitive types)
	 then check recursively that they ahev the same sub-nodes"

	self compareClasses: node1 to: node2.
	self compareProperties: node1 to: node2.
	self compareChildren: node1 to: node2
]

{ #category : #comparison }
FASTDifferentialValidator >> compareChildren: node1 to: node2 [
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
FASTDifferentialValidator >> compareClasses: node1 to: node2 [

	node1 class = node2 class ifFalse: [
		self ast: node1 differ: node2 ]
]

{ #category : #comparison }
FASTDifferentialValidator >> compareProperties: node1 to: node2 [
	"compare the values of the 'properties' (attributes with primitive types) of the two nodes
	 since the two nodes should be the same class, they have the same properties"

	(node1 class mooseDescription allPrimitiveProperties) do: [ :property || value1 value2 |
		(self propertyToCompare: property) ifTrue: [
			value1 := node1 perform: property implementingSelector.
			value2 := node2 perform: property implementingSelector.

			(value1 = value2) ifFalse: [
			self ast: node1 differ: node2 property: property
		]]
	]

]

{ #category : #utilities }
FASTDifferentialValidator >> getASTFromFileReference: aFileReference [

	| model |
	aFileReference readStreamDo: [ :stream |
		model := self getASTFromString: stream contents ].

	^self getTopLevelNodes: model
]

{ #category : #utilities }
FASTDifferentialValidator >> getASTFromString: stream [

	self subclassResponsibility  
]

{ #category : #utilities }
FASTDifferentialValidator >> getRootNode: aModel [

	^aModel detect: [ : e | e allParents isEmpty ]
]

{ #category : #utilities }
FASTDifferentialValidator >> getTopLevelNodes: model [

	self subclassResponsibility
]

{ #category : #initialization }
FASTDifferentialValidator >> initialize [

	super initialize.

	strict := false.
	skipPaths := #().
]

{ #category : #testing }
FASTDifferentialValidator >> isSourceFile: aFileReference [

	self subclassResponsibility 
]

{ #category : #'instance creation' }
FASTDifferentialValidator >> on: aDirectoryName [

	self runOnFileReference: aDirectoryName asFileReference
]

{ #category : #testing }
FASTDifferentialValidator >> propertyToCompare: aFMProperty [
	"do not compare on derived (ie. computed) properties, only those with a stored value
	 do not compare on startPos/endPos as they are not meaningfull"

	aFMProperty isDerived ifTrue: [^false].
	(#(startPos endPos) includes: aFMProperty implementingSelector) ifTrue: [^false].
	^true
]

{ #category : #utilities }
FASTDifferentialValidator >> reExportAST: ast [

	self subclassResponsibility
]

{ #category : #running }
FASTDifferentialValidator >> runOnDirectory: aDirectory [

	aDirectory isDirectory
		ifFalse: [ Exception signal: aDirectory fullName , ' not a directory' ].

	aDirectory children do: [ :fileRef | self runOnFileReference: fileRef ]
]

{ #category : #running }
FASTDifferentialValidator >> runOnFileReference: aFileReference [

	(self skipPaths includes: aFileReference fullName)
		ifTrue: [ ^self ].

	aFileReference isDirectory
		ifTrue: [ ^self runOnDirectory: aFileReference ].

	(self isSourceFile: aFileReference)
		ifTrue: [ ^self runOnSourceFile: aFileReference ].

]

{ #category : #running }
FASTDifferentialValidator >> runOnSourceFile: aFileReference [

	| astOrig astBis topLevelNodes |
	aFileReference fullName traceCr.

	topLevelNodes := self getASTFromFileReference: aFileReference.

	topLevelNodes ifNotEmpty: [
		
		astOrig := self getRootNode: topLevelNodes.
		astBis := self getRootNode:
			(self getASTFromString: (self reExportAST: astOrig)).
	
		[self compare: astOrig to: astBis]
		on: Notification
		do: [ "continue" ]
	]
]

{ #category : #accessing }
FASTDifferentialValidator >> skipPaths [

	^ skipPaths
]

{ #category : #accessing }
FASTDifferentialValidator >> skipPaths: anObject [

	skipPaths := anObject
]

{ #category : #accessing }
FASTDifferentialValidator >> strict [

	^ strict
]

{ #category : #accessing }
FASTDifferentialValidator >> strict: anObject [

	strict := anObject
]

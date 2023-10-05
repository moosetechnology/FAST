"
I'm a visitor who generates code that, when executed, recreates the visited FAST nodes (similarly to `RBDumpVisitor` and the `storeOn:` protocol).
"
Class {
	#name : #FASTDumpVisitor,
	#superclass : #Object,
	#instVars : [
		'propertyCache',
		'stream'
	],
	#category : #'FAST-Core-Tools-Visitor'
}

{ #category : #visiting }
FASTDumpVisitor class >> visit: aFASTEntity [

	^ self new
		  visit: aFASTEntity;
		  contents
]

{ #category : #accessing }
FASTDumpVisitor >> contents [

	^ stream contents
]

{ #category : #initialization }
FASTDumpVisitor >> initialize [

	stream := String new writeStream.
	propertyCache := IdentityDictionary new
]

{ #category : #enumerating }
FASTDumpVisitor >> propertiesAndValuesOf: aFASTEntity do: twoArgsBlock [

	"Iterate over the attributes and child relations of the given entity."

	| value |
	(self propertiesOf: aFASTEntity)
		select: [ :property | 
			(property isChildrenProperty or: [ 
				 (property hasOpposite | property isDerived) not ]) and: [ 
				value := aFASTEntity perform: property implementingSelector.
				property isMultivalued
					ifTrue: [ value isNotEmpty ]
					ifFalse: [ value isNotNil ] ] ]
		thenDo: [ :property | twoArgsBlock value: property value: value ]
]

{ #category : #enumerating }
FASTDumpVisitor >> propertiesOf: aFASTEntity [

	^ propertyCache
		  at: aFASTEntity class
		  ifAbsentPut: [ aFASTEntity allDeclaredProperties ]
]

{ #category : #accessing }
FASTDumpVisitor >> stream [

	^ stream
]

{ #category : #visiting }
FASTDumpVisitor >> visit: aFASTEntity [

	| beforeFirst |
	beforeFirst := true.
	stream << aFASTEntity className << ' new '.
	self propertiesAndValuesOf: aFASTEntity do: [ :property :value | 
		beforeFirst
			ifTrue: [ beforeFirst := false ]
			ifFalse: [ stream nextPut: $; ].
		stream nextPutAll: property implementingSelector asMutator.
		property hasOpposite
			ifTrue: [ "relation"
				property isMultivalued
					ifFalse: [ self visitOnlyChild: value ]
					ifTrue: [ self visitChildren: value ] ]
			ifFalse: [ "attribute" value printOn: stream ] ]
]

{ #category : #visiting }
FASTDumpVisitor >> visitChildren: children [

	stream nextPut: ${.
	children do: [ :aFASTEntity | self visit: aFASTEntity ].
	stream nextPut: $}
]

{ #category : #visiting }
FASTDumpVisitor >> visitOnlyChild: aFASTEntity [

	stream nextPut: $(.
	self visit: aFASTEntity.
	stream nextPut: $)
]

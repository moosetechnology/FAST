"
A FASTCopyVisitorCodeGeneratorTest is a test class for testing the behavior of FASTCopyVisitorCodeGenerator
"
Class {
	#name : #FASTCopyVisitorCodeGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'visitorClass',
		'visitorMethods',
		'generator'
	],
	#category : #'FAST-Core-Tools-Tests-VisitorGenerator'
}

{ #category : #running }
FASTCopyVisitorCodeGeneratorTest >> assertGeneratedMethod: aBlock [

	visitorMethods
		detect: [ :asso | aBlock value: asso key ]
		ifNone: [ self fail ]
]

{ #category : #running }
FASTCopyVisitorCodeGeneratorTest >> setUp [
	super setUp.

	generator := FASTCopyVisitorCodeGenerator new.

	visitorClass := Mock named: 'visitor'.
	visitorMethods := OrderedCollection new.

	(visitorClass stub compile: Any classified: Any) will: [ :method :category |
		visitorMethods add: method -> category ]
]

{ #category : #tests }
FASTCopyVisitorCodeGeneratorTest >> testGenerateCopyMethod [

	generator rootClass: FmxTraitsTestGenerateAccessorBEntity visitorClass: visitorClass.

	self assertGeneratedMethod: [ :methodCode |
		methodCode beginsWith: 'copy: ' ]
]

{ #category : #tests }
FASTCopyVisitorCodeGeneratorTest >> testShouldCopyPropertyFor [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassA asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToB' ].

	generator package: (FmxTraitsTestGenerateAccessorBClassA metamodel packages detect: [ :p | p name = 'Famix-MetamodelBuilder-TestsTraitsResources-A' ]).
	self assert: (generator shouldCopyProperty: property for: FmxTraitsTestGenerateAccessorBClassA).
	

]

{ #category : #tests }
FASTCopyVisitorCodeGeneratorTest >> testShouldNotCopyDerivedProperty [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassB asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToA' ].
		
	self assert: property isDerived.
	self deny: (generator shouldCopyProperty: property for: FmxTraitsTestGenerateAccessorBClassB)
]

{ #category : #tests }
FASTCopyVisitorCodeGeneratorTest >> testShouldNotCopyPropertyFromOtherPackage [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassB asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToA' ].
		
	generator package: (FmxTraitsTestGenerateAccessorBClassA metamodel packages detect: [ :p | p name = 'Famix-MetamodelBuilder-TestsTraitsResources-B' ]).
	self assert: (generator shouldCopyProperty: property for: FmxTraitsTestGenerateAccessorBClassA)
]

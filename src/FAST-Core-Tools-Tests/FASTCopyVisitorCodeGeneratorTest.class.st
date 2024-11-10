"
A FASTCopyVisitorCodeGeneratorTest is a test class for testing the behavior of FASTCopyVisitorCodeGenerator
"
Class {
	#name : 'FASTCopyVisitorCodeGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitorClass',
		'visitorMethods',
		'generator'
	],
	#category : 'FAST-Core-Tools-Tests-VisitorGenerator',
	#package : 'FAST-Core-Tools-Tests',
	#tag : 'VisitorGenerator'
}

{ #category : 'running' }
FASTCopyVisitorCodeGeneratorTest >> assertGeneratedMethod: aBlock [

	visitorMethods
		detect: [ :asso | aBlock value: asso key ]
		ifNone: [ self fail ]
]

{ #category : 'running' }
FASTCopyVisitorCodeGeneratorTest >> setUp [
	super setUp.

	generator := FASTCopyVisitorCodeGenerator new.

	visitorClass := Mock named: 'visitor'.

	visitorClass stub package willReturn: (self class package).

	visitorMethods := OrderedCollection new.
	(visitorClass stub compile: Any classified: Any) will: [ :method :category |
		visitorMethods add: method -> category ]
]

{ #category : 'running' }
FASTCopyVisitorCodeGeneratorTest >> tearDown [ 
	super tearDown.

	self class package extensionMethods do: #removeFromSystem
]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testGenerateCopyMethod [

	generator rootClass: FmxTraitsTestGenerateAccessorBEntity visitorClass: visitorClass.

	self assertGeneratedMethod: [ :methodCode |
		methodCode beginsWith: 'copy: ' ]
]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testShouldCopyMultiValuedDerivedProperty [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassB asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToA' ].
		
	self assert: property isDerived.
	self assert: (generator shouldCopyProperty: property)
]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testShouldCopyNotMultiValuedProperty [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassB asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToA' ].
		
	self deny: property isMultivalued.
	self assert: (generator shouldCopyProperty: property)
]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testShouldCopyPropertyToOtherEntity [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassA asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToB' ].

	self assert: (generator shouldCopyProperty: property).
	

]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testShouldNotCopyMultivaluedDerivedProperty [

	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassB asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToA' ].

	"focing it to be multivalued"
	property isMultivalued: true.
	self assert: property isMultivalued.
	self deny: (generator shouldCopyProperty: property)
]

{ #category : 'tests' }
FASTCopyVisitorCodeGeneratorTest >> testShouldNotCopyPropertyParent [
	"property pointing to parent should not be copied"
	| property |
	
	property := FmxTraitsTestGenerateAccessorBClassA asMooseDescription
		allProperties detect: [ :prop | prop name = 'relationToB' ].

	"forcing it to be to parent"
	property isContainer: true.
	self assert: property isContainer.
	self deny: (generator shouldCopyProperty: property)
]

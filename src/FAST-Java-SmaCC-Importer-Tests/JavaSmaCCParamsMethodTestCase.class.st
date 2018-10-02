Class {
	#name : #JavaSmaCCParamsMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCParamsMethodTestCase >> setUpMethods [
	params := (self parseMethod: 'params') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testBlockScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	"symbols := OrderedCollection new.
	params statementBlock fastScope do: [ :each | symbols add: each ].
	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testExpressionParent [
	self assert: params statements first expression parentNode equals: params statements first  
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testExpressionRHSContentType [
	self assert: params statements first expression expression first class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testExpressionRHSParent [
	self assert: params statements first expression rightOperand parentNode equals: params statements first expression
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testExpressionRHSType [

	self assert: params statements first expression rightOperand class equals: FASTJavaOperationRightOperand 
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testExpressionType [

	self assert: params statements first expression class equals: FASTJavaInfixOperation  
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testFirstParameterName [
	self assert: params parameters first name equals: 'a'.
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testParametersCount [
	self assert: params parameters size equals: 3
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testParametersParent [
	params parameters do: [ :each | self assert: each parentNode equals: params ]
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	"symbols := OrderedCollection new.
	params fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 3.
	self assert: (symbols count: [:each | each name = 'a']) equals: 1.
	self assert: (symbols count: [:each | each name = 'b']) equals: 1.
	self assert: (symbols count: [:each | each name = 'c']) equals: 1."
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testSecondParameterName [
	self assert: params parameters second name equals: 'b'.
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testStatementsCount [
	self assert: params statements size equals: 1
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testStatementsParent [
	self assert: params statements last parentNode equals: params statementBlock 
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testStatementsType [
	self assert: params statements last class equals: FASTExpressionStatement 
]

{ #category : #tests }
JavaSmaCCParamsMethodTestCase >> testThirdParameterName [
	self assert: params parameters third name equals: 'c'.
]

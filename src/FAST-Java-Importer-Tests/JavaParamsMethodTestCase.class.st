Class {
	#name : #JavaParamsMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaParamsMethodTestCase >> setUpMethods [
	params := self assembleFastMethodFromModelByName: 'params'
]

{ #category : #tests }
JavaParamsMethodTestCase >> testBlockScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	"symbols := OrderedCollection new.
	params statementBlock fastScope do: [ :each | symbols add: each ].
	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaParamsMethodTestCase >> testExpressionParent [
	self assert: params statements first expression parentNode equals: params statements first  
]

{ #category : #tests }
JavaParamsMethodTestCase >> testExpressionRHSParent [
	self assert: params statements first expression rightOperand parentNode equals: params statements first expression
]

{ #category : #tests }
JavaParamsMethodTestCase >> testExpressionRHSType [

	self assert: params statements first expression rightOperand class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaParamsMethodTestCase >> testExpressionType [

	self assert: params statements first expression class equals: FASTJavaInfixOperation  
]

{ #category : #tests }
JavaParamsMethodTestCase >> testFirstParameterName [
	self assert: params parameters first name equals: 'a'.
]

{ #category : #tests }
JavaParamsMethodTestCase >> testParametersCount [
	self assert: params parameters size equals: 3
]

{ #category : #tests }
JavaParamsMethodTestCase >> testParametersParent [
	params parameters do: [ :each | self assert: each parentNode equals: params ]
]

{ #category : #tests }
JavaParamsMethodTestCase >> testScope [
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
JavaParamsMethodTestCase >> testSecondParameterName [
	self assert: params parameters second name equals: 'b'.
]

{ #category : #tests }
JavaParamsMethodTestCase >> testStatementsCount [
	self assert: params statements size equals: 1
]

{ #category : #tests }
JavaParamsMethodTestCase >> testStatementsParent [
	self assert: params statements last parentNode equals: params statementBlock 
]

{ #category : #tests }
JavaParamsMethodTestCase >> testStatementsType [
	self assert: params statements last class equals: FASTExpressionStatement 
]

{ #category : #tests }
JavaParamsMethodTestCase >> testThirdParameterName [
	self assert: params parameters third name equals: 'c'.
]

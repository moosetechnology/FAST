Class {
	#name : #JavaALittleOfVariablesMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaALittleOfVariablesMethodTestCase >> setUpMethods [
	aLittleOfVariables := self assembleFastMethodFromModelByName: 'aLittleOfVariables'
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testBlockScope [
	| symbols |
	symbols := OrderedCollection new.
	aLittleOfVariables statementBlock fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 1.
	self assert: symbols first name equals: 'x'.
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testRetunStatementExpressionName [
	self assert: aLittleOfVariables statements second expression name equals: 'x'
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testRetunStatementExpressionType [
	self assert: aLittleOfVariables statements second expression class equals: FASTJavaIdentifier.
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testScope [
	| symbols |
	symbols := OrderedCollection new.
	aLittleOfVariables fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 0
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testStatementsCount [
	self assert: aLittleOfVariables statements size equals: 2
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testStatementsType [
	self
		assert: aLittleOfVariables statements first class equals: FASTJavaVarDeclStatement;
		assert: aLittleOfVariables statements last class equals: FASTReturnStatement
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionParent [
	self assert: aLittleOfVariables statements first declarators first expression parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionType [
	self assert: aLittleOfVariables statements first declarators first expression class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionValue [
	self assert: aLittleOfVariables statements  first declarators first expression value equals: '5'
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorType [
	self assert: aLittleOfVariables statements first declarators first class equals: FASTJavaVariableDeclarator
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableName [
	self assert: aLittleOfVariables statements first declarators first variable name equals: 'x'
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableParent [
	self assert: aLittleOfVariables statements first declarators first variable parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableType [
	self assert: aLittleOfVariables statements first declarators first variable class equals: FASTNamedEntity
]

{ #category : #tests }
JavaALittleOfVariablesMethodTestCase >> testVariableDeclaratorsCount [
	self assert: aLittleOfVariables statements first declarators size equals: 1
]

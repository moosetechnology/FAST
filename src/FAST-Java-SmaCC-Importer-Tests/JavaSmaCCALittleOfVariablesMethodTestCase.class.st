Class {
	#name : #JavaSmaCCALittleOfVariablesMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariablesMethodTestCase >> setUpMethods [
	aLittleOfVariables := (self parseMethod: 'aLittleOfVariables') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testBlockScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	
	"
	symbols := OrderedCollection new.
	aLittleOfVariables statementBlock fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 1.
	self assert: symbols first name equals: 'x'."
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testRetunStatementExpressionName [
	self assert: aLittleOfVariables statements second expression name equals: 'x'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testRetunStatementExpressionType [
	self assert: aLittleOfVariables statements second expression class equals: FASTJavaIdentifier.
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	"symbols := OrderedCollection new.
	aLittleOfVariables fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testStatementsCount [
	self assert: aLittleOfVariables statements size equals: 2
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testStatementsType [
	self
		assert: aLittleOfVariables statements first class equals: FASTJavaVarDeclStatement;
		assert: aLittleOfVariables statements last class equals: FASTReturnStatement
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionParent [
	self assert: aLittleOfVariables statements first declarators first expression parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionType [
	self assert: aLittleOfVariables statements first declarators first expression class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorExpressionValue [
	self assert: aLittleOfVariables statements  first declarators first expression value equals: '5'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorType [
	self assert: aLittleOfVariables statements first declarators first class equals: FASTJavaVariableDeclarator
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableName [
	self assert: aLittleOfVariables statements first declarators first variable name equals: 'x'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableParent [
	self assert: aLittleOfVariables statements first declarators first variable parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorVariableType [
	self assert: aLittleOfVariables statements first declarators first variable class equals: FASTNamedEntity
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTestCase >> testVariableDeclaratorsCount [
	self assert: aLittleOfVariables statements first declarators size equals: 1
]

Class {
	#name : #JavaSmaCCALittleOfVariablesMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'aLittleOfVariables'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCALittleOfVariablesMethodTest >> methodALittleOfVariables [
	
	^ 'int aLittleOfVariables() {
		int x = 5;	
		return x;
	}'
]

{ #category : #running }
JavaSmaCCALittleOfVariablesMethodTest >> setUp [
	aLittleOfVariables := (self parseMethod: 'aLittleOfVariables') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testBlockScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	
	"
	symbols := OrderedCollection new.
	aLittleOfVariables statementBlock fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 1.
	self assert: symbols first name equals: 'x'."
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testReturnStatementExpressionName [
	self assert: aLittleOfVariables statements second expression name equals: 'x'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testReturnStatementExpressionType [
	self assert: aLittleOfVariables statements second expression class equals: FASTJavaIdentifier.
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testScope [
	| symbols |
	self flag: 'Should we keep the fastScope ? '.
	"symbols := OrderedCollection new.
	aLittleOfVariables fastScope do: [:each | symbols add: each].

	self assert: symbols size equals: 0"
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testStatementsCount [
	self assert: aLittleOfVariables statements size equals: 2
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testStatementsType [
	self
		assert: aLittleOfVariables statements first class equals: FASTJavaVarDeclStatement;
		assert: aLittleOfVariables statements last class equals: FASTReturnStatement
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorExpressionParent [
	self assert: aLittleOfVariables statements first declarators first expression parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorExpressionType [
	self assert: aLittleOfVariables statements first declarators first expression class equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorExpressionValue [
	self assert: aLittleOfVariables statements  first declarators first expression value equals: '5'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorType [
	self assert: aLittleOfVariables statements first declarators first class equals: FASTJavaVariableDeclarator
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorVariableName [
	self assert: aLittleOfVariables statements first declarators first variable name equals: 'x'
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorVariableParent [
	self assert: aLittleOfVariables statements first declarators first variable parentNode equals: aLittleOfVariables statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorVariableType [
	self assert: aLittleOfVariables statements first declarators first variable class equals: FASTNamedEntity
]

{ #category : #tests }
JavaSmaCCALittleOfVariablesMethodTest >> testVariableDeclaratorsCount [
	self assert: aLittleOfVariables statements first declarators size equals: 1
]

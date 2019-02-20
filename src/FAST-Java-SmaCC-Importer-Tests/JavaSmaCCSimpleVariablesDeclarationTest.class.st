Class {
	#name : #JavaSmaCCSimpleVariablesDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSimpleVariableDeclaration',
		'methodSimpleVariablesDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSimpleVariablesDeclarationTest >> methodSimpleVariablesDeclaration [
	^ 'void forMethod() {
	int x, y;
}'
]

{ #category : #running }
JavaSmaCCSimpleVariablesDeclarationTest >> setUp [
	super setUp.
	methodSimpleVariablesDeclaration := (self parseMethod: 'SimpleVariablesDeclaration')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSimpleVariablesDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: methodSimpleVariablesDeclaration statements first declarators first variable name
		equals: 'x'.
	self
		assert: methodSimpleVariablesDeclaration statements first declarators second variable name
		equals: 'y'
]

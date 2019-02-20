Class {
	#name : #JavaSmaCCSimpleVariableDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSimpleVariableDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSimpleVariableDeclarationTest >> methodSimpleVariableDeclaration [
	^ 'void forMethod() {
	int x;
}'
]

{ #category : #running }
JavaSmaCCSimpleVariableDeclarationTest >> setUp [
	super setUp.
	methodSimpleVariableDeclaration := (self parseMethod: 'SimpleVariableDeclaration')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSimpleVariableDeclarationTest >> testVariableDeclaratorExpressionName [
	self
		assert: methodSimpleVariableDeclaration statements first declarators first variable name
		equals: 'x'
]

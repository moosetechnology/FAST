Class {
	#name : #JavaSmaCCSimpleVariableDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSimpleVariableDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCSimpleVariableDeclaration >> setUpMethods [
	methodSimpleVariableDeclaration := (self parseMethod: 'SimpleVariableDeclaration') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCSimpleVariableDeclaration >> testVariableDeclaratorExpressionName [
	self
		assert: methodSimpleVariableDeclaration statements first declarators first variable name
		equals: 'x'
]
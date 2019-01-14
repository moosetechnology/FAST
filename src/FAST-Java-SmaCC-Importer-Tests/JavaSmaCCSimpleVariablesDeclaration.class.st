Class {
	#name : #JavaSmaCCSimpleVariablesDeclaration,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSimpleVariableDeclaration',
		'methodSimpleVariablesDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCSimpleVariablesDeclaration >> setUpMethods [
	methodSimpleVariablesDeclaration := (self parseMethod: 'SimpleVariablesDeclaration')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSimpleVariablesDeclaration >> testVariableDeclaratorExpressionName [
	self
		assert: methodSimpleVariablesDeclaration statements first declarators first variable name
		equals: 'x'.
	self
		assert: methodSimpleVariablesDeclaration statements first declarators second variable name
		equals: 'y'
]

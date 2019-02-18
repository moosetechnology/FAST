Class {
	#name : #JavaSmaCCALittleOfVariables3MethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'aLittleOfVariables3'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCALittleOfVariables3MethodTest >> methodALittleOfVariables3 [
	
	^ 'char aLittleOfVariables3() {
		char x = ''c'';	
		return x;
	}'
]

{ #category : #running }
JavaSmaCCALittleOfVariables3MethodTest >> setUp [
	aLittleOfVariables3 := (self parseMethod: 'aLittleOfVariables3') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTest >> testVariableDeclaratorExpressionParent3 [
	self
		assert: aLittleOfVariables3 statements first declarators first expression parentNode
		equals: aLittleOfVariables3 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTest >> testVariableDeclaratorExpressionType3 [
	self assert: aLittleOfVariables3 statements first declarators first expression class equals: FASTJavaCharacterLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTest >> testVariableDeclaratorExpressionValue3 [
	self assert: aLittleOfVariables3 statements first declarators first expression value equals: '''c'''
]

Class {
	#name : #JavaSmaCCALittleOfVariables3MethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables3MethodTestCase >> setUpMethods [
	aLittleOfVariables3 := (self parseMethod: 'aLittleOfVariables3') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionParent3 [
	self
		assert: aLittleOfVariables3 statements first declarators first expression parentNode
		equals: aLittleOfVariables3 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionType3 [
	self assert: aLittleOfVariables3 statements first declarators first expression class equals: FASTJavaCharacterLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionValue3 [
	self assert: aLittleOfVariables3 statements first declarators first expression value equals: '''c'''
]

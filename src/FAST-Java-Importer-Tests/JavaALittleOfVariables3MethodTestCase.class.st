Class {
	#name : #JavaALittleOfVariables3MethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaALittleOfVariables3MethodTestCase >> setUpMethods [
	aLittleOfVariables3 := self assembleFastMethodFromModelByName: 'aLittleOfVariables3'
]

{ #category : #tests }
JavaALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionParent3 [
	self
		assert: aLittleOfVariables3 statements first declarators first expression parentNode
		equals: aLittleOfVariables3 statements first declarators first
]

{ #category : #tests }
JavaALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionType3 [
	self assert: aLittleOfVariables3 statements first declarators first expression class equals: FASTJavaCharacterLiteral
]

{ #category : #tests }
JavaALittleOfVariables3MethodTestCase >> testVariableDeclaratorExpressionValue3 [
	self assert: aLittleOfVariables3 statements first declarators first expression value equals: '''c'''
]

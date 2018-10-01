Class {
	#name : #JavaALittleOfVariables5MethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaALittleOfVariables5MethodTestCase >> setUpMethods [
	aLittleOfVariables5 := self assembleFastMethodFromModelByName: 'aLittleOfVariables5'
]

{ #category : #tests }
JavaALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionParent5 [
	self
		assert: aLittleOfVariables5 statements first declarators first expression parentNode
		equals: aLittleOfVariables5 statements first declarators first
]

{ #category : #tests }
JavaALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionType5 [
	self assert: aLittleOfVariables5 statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : #tests }
JavaALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionValue5 [
	self assert: aLittleOfVariables5 statements  first declarators first expression value equals: 'null'
]

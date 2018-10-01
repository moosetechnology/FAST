Class {
	#name : #JavaALittleOfVariables4MethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaALittleOfVariables4MethodTestCase >> setUpMethods [
	aLittleOfVariables4 := self assembleFastMethodFromModelByName: 'aLittleOfVariables4'
]

{ #category : #tests }
JavaALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionParent4 [
	self
		assert: aLittleOfVariables4 statements first declarators first expression parentNode
		equals: aLittleOfVariables4 statements first declarators first
]

{ #category : #tests }
JavaALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionType4 [
	self assert: aLittleOfVariables4 statements first declarators first expression class equals: FASTJavaStringLiteral
]

{ #category : #tests }
JavaALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionValue4 [
	self assert: aLittleOfVariables4 statements first declarators first expression value equals: '"test"'
]

Class {
	#name : #JavaALittleOfVariables2MethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaALittleOfVariables2MethodTestCase >> setUpMethods [
	aLittleOfVariables2 := self assembleFastMethodFromModelByName: 'aLittleOfVariables2'
]

{ #category : #tests }
JavaALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionParent2 [
	self
		assert: aLittleOfVariables2 statements first declarators first expression parentNode
		equals: aLittleOfVariables2 statements first declarators first.
]

{ #category : #tests }
JavaALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionType2 [
	self assert: aLittleOfVariables2 statements first declarators first expression class equals: FASTJavaFloatLiteral
]

{ #category : #tests }
JavaALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionValue2 [
	self assert: aLittleOfVariables2 statements first declarators first expression value equals: '5.5'
]

Class {
	#name : #JavaSmaCCALittleOfVariables2MethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables2MethodTestCase >> setUpMethods [
	aLittleOfVariables2 := (self parseMethod: 'aLittleOfVariables2') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionParent2 [
	self
		assert: aLittleOfVariables2 statements first declarators first expression parentNode
		equals: aLittleOfVariables2 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionType2 [
	self assert: aLittleOfVariables2 statements first declarators first expression class equals: FASTJavaFloatLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTestCase >> testVariableDeclaratorExpressionValue2 [
	self assert: aLittleOfVariables2 statements first declarators first expression value equals: '5.5'
]

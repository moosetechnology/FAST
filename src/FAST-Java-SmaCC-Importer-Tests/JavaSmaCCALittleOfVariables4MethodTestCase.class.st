Class {
	#name : #JavaSmaCCALittleOfVariables4MethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables4MethodTestCase >> setUpMethods [
	aLittleOfVariables4 := (self parseMethod: 'aLittleOfVariables4') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionParent4 [
	self
		assert: aLittleOfVariables4 statements first declarators first expression parentNode
		equals: aLittleOfVariables4 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionType4 [
	self assert: aLittleOfVariables4 statements first declarators first expression class equals: FASTJavaStringLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTestCase >> testVariableDeclaratorExpressionValue4 [
	self assert: aLittleOfVariables4 statements first declarators first expression value equals: '"test"'
]

Class {
	#name : #JavaSmaCCALittleOfVariables5MethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables5MethodTestCase >> setUpMethods [
	aLittleOfVariables5 := (self parseMethod: 'aLittleOfVariables5') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionParent5 [
	self
		assert: aLittleOfVariables5 statements first declarators first expression parentNode
		equals: aLittleOfVariables5 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionType5 [
	self assert: aLittleOfVariables5 statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTestCase >> testVariableDeclaratorExpressionValue5 [
	self assert: aLittleOfVariables5 statements  first declarators first expression value equals: 'null'
]

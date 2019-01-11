Class {
	#name : #JavaSmaCCALittleOfVariables4MethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables4MethodTest >> setUpMethods [
	aLittleOfVariables4 := (self parseMethod: 'aLittleOfVariables4') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTest >> testVariableDeclaratorExpressionParent4 [
	self
		assert: aLittleOfVariables4 statements first declarators first expression parentNode
		equals: aLittleOfVariables4 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTest >> testVariableDeclaratorExpressionType4 [
	self assert: aLittleOfVariables4 statements first declarators first expression class equals: FASTJavaStringLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables4MethodTest >> testVariableDeclaratorExpressionValue4 [
	self assert: aLittleOfVariables4 statements first declarators first expression value equals: '"test"'
]

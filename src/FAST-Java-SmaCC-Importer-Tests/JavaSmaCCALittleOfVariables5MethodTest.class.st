Class {
	#name : #JavaSmaCCALittleOfVariables5MethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables5MethodTest >> setUpMethods [
	aLittleOfVariables5 := (self parseMethod: 'aLittleOfVariables5') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTest >> testVariableDeclaratorExpressionParent5 [
	self
		assert: aLittleOfVariables5 statements first declarators first expression parentNode
		equals: aLittleOfVariables5 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTest >> testVariableDeclaratorExpressionType5 [
	self assert: aLittleOfVariables5 statements first declarators first expression class equals: FASTJavaNullLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables5MethodTest >> testVariableDeclaratorExpressionValue5 [
	self assert: aLittleOfVariables5 statements  first declarators first expression value equals: 'null'
]

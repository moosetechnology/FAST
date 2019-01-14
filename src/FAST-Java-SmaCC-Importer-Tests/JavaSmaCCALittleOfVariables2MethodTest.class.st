Class {
	#name : #JavaSmaCCALittleOfVariables2MethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCALittleOfVariables2MethodTest >> setUpMethods [
	aLittleOfVariables2 := (self parseMethod: 'aLittleOfVariables2') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTest >> testVariableDeclaratorExpressionParent2 [
	self
		assert: aLittleOfVariables2 statements first declarators first expression parentNode
		equals: aLittleOfVariables2 statements first declarators first
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTest >> testVariableDeclaratorExpressionType2 [
	self assert: aLittleOfVariables2 statements first declarators first expression class equals: FASTJavaFloatLiteral
]

{ #category : #tests }
JavaSmaCCALittleOfVariables2MethodTest >> testVariableDeclaratorExpressionValue2 [
	self assert: aLittleOfVariables2 statements first declarators first expression value equals: '5.5'
]
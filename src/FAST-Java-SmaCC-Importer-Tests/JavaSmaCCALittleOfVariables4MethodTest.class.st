Class {
	#name : #JavaSmaCCALittleOfVariables4MethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'aLittleOfVariables4'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCALittleOfVariables4MethodTest >> methodALittleOfVariables4 [
	
	^ 'String aLittleOfVariables4() {
		String x = "test";	
		return x;
	}'
]

{ #category : #running }
JavaSmaCCALittleOfVariables4MethodTest >> setUp [
	aLittleOfVariables4 := (self parseMethod: 'aLittleOfVariables4') allFASTJavaMethodEntity
		first
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
	self assert: aLittleOfVariables4 statements first declarators first expression value equals: 'test'
]

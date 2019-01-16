Class {
	#name : #JavaSmaCCUnarySubstractionExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unarySubstractionMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnarySubstractionExpression >> methodUnarySubstraction [
	^ 'public void patate () {
	int i = -i;	
}'
]

{ #category : #running }
JavaSmaCCUnarySubstractionExpression >> setUp [
	unarySubstractionMethod := (self parseMethod: 'unarySubstraction') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnarySubstractionExpression >> testUnaryExpressionIsPrefixed [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnarySubstractionExpression >> testUnaryExpressionOperator [
	self deny: unarySubstractionMethod statements first childrenNode first expression operator equals: '+'
]

{ #category : #running }
JavaSmaCCUnarySubstractionExpression >> testUnaryExpressionType [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

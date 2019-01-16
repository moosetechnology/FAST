Class {
	#name : #JavaSmaCCUnaryBitInvertExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryBitInvertMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryBitInvertExpression >> methodUnaryBitInvert [
	^ 'public void patate () {
	int i = ~i;	
}'
]

{ #category : #running }
JavaSmaCCUnaryBitInvertExpression >> setUp [
	unaryBitInvertMethod := (self parseMethod: 'unaryBitInvert') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryBitInvertExpression >> testUnaryExpressionIsPrefixed [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryBitInvertExpression >> testUnaryExpressionOperator [
	self deny: unaryBitInvertMethod statements first childrenNode first expression operator equals: '~'
]

{ #category : #running }
JavaSmaCCUnaryBitInvertExpression >> testUnaryExpressionType [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

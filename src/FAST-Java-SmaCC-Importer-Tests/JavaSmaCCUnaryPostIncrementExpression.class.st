Class {
	#name : #JavaSmaCCUnaryPostIncrementExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPostIncrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpression >> methodUnaryPostIncrement [
	^ 'public void patate () {
	i++;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpression >> setUp [
	unaryPostIncrementMethod := (self parseMethod: 'unaryPostIncrement') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpression >> testUnaryExpressionIsPrefixed [
	self deny: unaryPostIncrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpression >> testUnaryExpressionOperator [
	self deny: unaryPostIncrementMethod statements first childrenNode first operator equals: '++'
]

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpression >> testUnaryExpressionType [
	self
		assert: unaryPostIncrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

Class {
	#name : #JavaSmaCCUnaryPreDecrementExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPreDecrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> methodUnaryPreDecrement [
	^ 'public void patate () {
	--i;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> setUp [
	unaryPreDecrementMethod := (self parseMethod: 'unaryPreDecrement') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> testUnaryExpressionIsPrefixed [
	self assert: unaryPreDecrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> testUnaryExpressionOperator [
	self deny: unaryPreDecrementMethod statements first childrenNode first operator equals: '--'
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> testUnaryExpressionType [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

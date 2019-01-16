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
	self
		assert: unaryPreDecrementMethod statements first childrenNode first operator
		equals: '--'
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> testUnaryExpressionOperatorType [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first operator class
		equals: ByteString
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpression >> testUnaryExpressionType [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

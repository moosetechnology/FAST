Class {
	#name : #JavaSmaCCUnaryPostDecrementExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPostDecrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> methodUnaryPostDecrement [
	^ 'public void patate () {
	i--;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> setUp [
	unaryPostDecrementMethod := (self parseMethod: 'unaryPostDecrement') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> testUnaryExpressionIsPrefixed [
	self deny: unaryPostDecrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> testUnaryExpressionOperator [
	self
		assert: unaryPostDecrementMethod statements first childrenNode first operator
		equals: '--'
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> testUnaryExpressionOperatorType [
	self
		assert: unaryPostDecrementMethod statements first childrenNode first operator class
		equals: ByteString
]

{ #category : #running }
JavaSmaCCUnaryPostDecrementExpression >> testUnaryExpressionType [
	self
		assert: unaryPostDecrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

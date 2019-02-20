Class {
	#name : #JavaSmaCCUnaryPreDecrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPreDecrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryPreDecrementExpressionTest >> methodUnaryPreDecrement [
	^ 'public void patate () {
	--i;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPreDecrementExpressionTest >> setUp [
	super setUp.
	unaryPreDecrementMethod := (self parseMethod: 'unaryPreDecrement') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: unaryPreDecrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first operator
		equals: '--'
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPreDecrementExpressionTest >> testUnaryExpressionType [
	self
		assert: unaryPreDecrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

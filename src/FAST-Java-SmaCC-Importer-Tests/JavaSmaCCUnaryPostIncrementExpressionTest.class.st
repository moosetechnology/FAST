Class {
	#name : #JavaSmaCCUnaryPostIncrementExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPostIncrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryPostIncrementExpressionTest >> methodUnaryPostIncrement [
	^ 'public void patate () {
	i++;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPostIncrementExpressionTest >> setUp [
	super setUp.
	unaryPostIncrementMethod := (self parseMethod: 'unaryPostIncrement') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionIsPrefixed [
	self deny: unaryPostIncrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unaryPostIncrementMethod statements first childrenNode first operator
		equals: '++'
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unaryPostIncrementMethod statements first childrenNode first operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryPostIncrementExpressionTest >> testUnaryExpressionType [
	self
		assert: unaryPostIncrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

Class {
	#name : #JavaSmaCCUnaryBitInvertExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryBitInvertMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryBitInvertExpressionTest >> methodUnaryBitInvert [
	^ 'public void patate () {
	int i = ~i;	
}'
]

{ #category : #running }
JavaSmaCCUnaryBitInvertExpressionTest >> setUp [
	super setUp.
	unaryBitInvertMethod := (self parseMethod: 'unaryBitInvert') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression operator
		equals: '~'
]

{ #category : #tests }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryBitInvertExpressionTest >> testUnaryExpressionType [
	self
		assert: unaryBitInvertMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

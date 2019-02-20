Class {
	#name : #JavaSmaCCUnarySubstractionExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unarySubstractionMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnarySubstractionExpressionTest >> methodUnarySubstraction [
	^ 'public void patate () {
	int i = -i;	
}'
]

{ #category : #running }
JavaSmaCCUnarySubstractionExpressionTest >> setUp [
	super setUp.
	unarySubstractionMethod := (self parseMethod: 'unarySubstraction') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression operator
		equals: '-'
]

{ #category : #tests }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnarySubstractionExpressionTest >> testUnaryExpressionType [
	self
		assert: unarySubstractionMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

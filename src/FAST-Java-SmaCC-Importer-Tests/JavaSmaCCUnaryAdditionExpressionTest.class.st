Class {
	#name : #JavaSmaCCUnaryAdditionExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryAdditionMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryAdditionExpressionTest >> methodUnaryAddition [
	^ 'public void patate () {
	int i = +i;	
}'
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpressionTest >> setUp [
	super setUp.
	unaryAdditionMethod := (self parseMethod: 'unaryAddition') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionIsPrefixed [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression operator
		equals: '+'
]

{ #category : #tests }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryAdditionExpressionTest >> testUnaryExpressionType [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

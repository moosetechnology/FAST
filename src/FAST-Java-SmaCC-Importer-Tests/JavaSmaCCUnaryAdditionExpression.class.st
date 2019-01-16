Class {
	#name : #JavaSmaCCUnaryAdditionExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryAdditionMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> methodUnaryAddition [
	^ 'public void patate () {
	int i = +i;	
}'
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> setUp [
	unaryAdditionMethod := (self parseMethod: 'unaryAddition') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> testUnaryExpressionIsPrefixed [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> testUnaryExpressionOperator [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression operator
		equals: '+'
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> testUnaryExpressionOperatorType [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #running }
JavaSmaCCUnaryAdditionExpression >> testUnaryExpressionType [
	self
		assert: unaryAdditionMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

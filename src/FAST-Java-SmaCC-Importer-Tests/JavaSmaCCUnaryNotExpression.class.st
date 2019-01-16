Class {
	#name : #JavaSmaCCUnaryNotExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryNotMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryNotExpression >> methodUnaryNot [
	^ 'public void patate () {
	boolean b = !b;	
}'
]

{ #category : #running }
JavaSmaCCUnaryNotExpression >> setUp [
	unaryNotMethod := (self parseMethod: 'unaryNot') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryNotExpression >> testUnaryExpressionIsPrefixed [
	self assert: unaryNotMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryNotExpression >> testUnaryExpressionOperator [
	self
		assert: unaryNotMethod statements first childrenNode first expression operator
		equals: '!'
]

{ #category : #running }
JavaSmaCCUnaryNotExpression >> testUnaryExpressionOperatorType [
	self
		assert: unaryNotMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #running }
JavaSmaCCUnaryNotExpression >> testUnaryExpressionType [
	self
		assert: unaryNotMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

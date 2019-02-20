Class {
	#name : #JavaSmaCCUnaryNotExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryNotMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCUnaryNotExpressionTest >> methodUnaryNot [
	^ 'public void patate () {
	boolean b = !b;	
}'
]

{ #category : #running }
JavaSmaCCUnaryNotExpressionTest >> setUp [
	super setUp.
	unaryNotMethod := (self parseMethod: 'unaryNot') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionIsPrefixed [
	self assert: unaryNotMethod statements first childrenNode first expression isPrefixedUnaryExpression
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionOperator [
	self
		assert: unaryNotMethod statements first childrenNode first expression operator
		equals: '!'
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionOperatorType [
	self
		assert: unaryNotMethod statements first childrenNode first expression operator class
		equals: ByteString
]

{ #category : #tests }
JavaSmaCCUnaryNotExpressionTest >> testUnaryExpressionType [
	self
		assert: unaryNotMethod statements first childrenNode first expression class
		equals: FASTJavaUnaryExpression
]

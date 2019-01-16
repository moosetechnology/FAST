Class {
	#name : #JavaSmaCCUnaryPreIncrementExpression,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'unaryPreIncrementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpression >> methodUnaryPreIncrement [
	^ 'public void patate () {
	++i;		
}'
]

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpression >> setUp [
	unaryPreIncrementMethod := (self parseMethod: 'unaryPreIncrement') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpression >> testUnaryExpressionIsPrefixed [
	self assert: unaryPreIncrementMethod statements first childrenNode first isPrefixedUnaryExpression
]

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpression >> testUnaryExpressionOperator [
	self
		assert: unaryPreIncrementMethod statements first childrenNode first operator
		equals: '++'
]

{ #category : #running }
JavaSmaCCUnaryPreIncrementExpression >> testUnaryExpressionType [
	self
		assert: unaryPreIncrementMethod statements first childrenNode first class
		equals: FASTJavaUnaryExpression
]

Class {
	#name : #JavaSmaCCWhileWhileMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCWhileWhileMethodTestCase >> setUpMethods [
	whileWhile := (self parseMethod: 'whileWhile') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileBodyContentType [
	self assert: whileWhile statements second body childrenNode first class equals: FASTStatementBlock
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileBodyParent [
	self assert: whileWhile statements second body parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileBodyType [
	self assert: whileWhile statements second body class equals: FASTJavaBodyStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileConditionContentType [
	self assert: whileWhile statements second condition childrenNode first class equals: FASTBooleanLiteral
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileConditionParent [
	self assert: whileWhile statements second condition parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testFirstWhileConditionType [
	self assert: whileWhile statements second condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileBodyContentType [
	self assert: whileWhile statements third body statements first body childrenNode first class equals: FASTExpressionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileBodyParent [
	self assert: whileWhile statements third body statements first body parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileBodyType [
	self assert: whileWhile statements third body statements first body class equals: FASTJavaBodyStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileConditionContentType [
	self assert: whileWhile statements third body statements first condition childrenNode first class equals: FASTBooleanLiteral
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileConditionParent [
	self assert: whileWhile statements third body statements first condition parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testNestedWhileConditionType [
	self assert: whileWhile statements third body statements first condition class equals: FASTJavaConditionStatement 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileBodyContentType [
	self assert: whileWhile statements third body childrenNode first class equals: FASTStatementBlock
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileBodyParent [
	self assert: whileWhile statements third body parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileBodyType [
	self assert: whileWhile statements third body class equals: FASTJavaBodyStatement 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileConditionContentType [
	self assert: whileWhile statements third condition childrenNode first class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileConditionParent [
	self assert: whileWhile statements third condition parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testSecondWhileConditionType [
	self assert: whileWhile statements third condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testStatementsCount [
	self assert: whileWhile statements size equals: 5
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testStatementsParent [
	whileWhile statements do: [ :each | self assert: each parentNode equals: whileWhile statementBlock ]
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTestCase >> testStatementsType [
	self
		assert: whileWhile statements first class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements second class equals: FASTJavaWhileStatement;
		assert: whileWhile statements third class equals: FASTJavaWhileStatement;
		assert: (whileWhile statements at: 4) class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements last class equals: FASTReturnStatement
]

Class {
	#name : #JavaWhileWhileMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaWhileWhileMethodTestCase >> setUpMethods [
	whileWhile := self assembleFastMethodFromModelByName: 'whileWhile'
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testFirstWhileBodyParent [
	self assert: whileWhile statements second body parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testFirstWhileBodyType [
	self assert: whileWhile statements second body class equals: FASTStatementBlock 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testFirstWhileConditionParent [
	self assert: whileWhile statements second condition parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testFirstWhileConditionType [
	self assert: whileWhile statements second condition class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testNestedWhileBodyParent [
	self assert: whileWhile statements third body statements first body parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testNestedWhileBodyType [

	self assert: whileWhile statements third body statements first body class equals: FASTExpressionStatement 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testNestedWhileConditionParent [
	self assert: whileWhile statements third body statements first condition parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testNestedWhileConditionType [
	self assert: whileWhile statements third body statements first condition class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testSecondWhileBodyParent [
	self assert: whileWhile statements third body parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testSecondWhileBodyType [
	self assert: whileWhile statements third body class equals: FASTStatementBlock 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testSecondWhileConditionParent [
	self assert: whileWhile statements third condition parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testSecondWhileConditionType [
	self assert: whileWhile statements third condition class equals: FASTJavaInfixOperation 
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testStatementsCount [
	self assert: whileWhile statements size equals: 5
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testStatementsParent [
	whileWhile statements do: [ :each | self assert: each parentNode equals: whileWhile statementBlock ]
]

{ #category : #tests }
JavaWhileWhileMethodTestCase >> testStatementsType [
	self
		assert: whileWhile statements first class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements second class equals: FASTJavaWhileStatement;
		assert: whileWhile statements third class equals: FASTJavaWhileStatement;
		assert: (whileWhile statements at: 4) class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements last class equals: FASTReturnStatement
]

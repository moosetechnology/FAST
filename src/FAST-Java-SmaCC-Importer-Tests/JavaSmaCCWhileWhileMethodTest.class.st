Class {
	#name : #JavaSmaCCWhileWhileMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'whileWhile'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCWhileWhileMethodTest >> methodWhileWhile [
	
	^ 
'void whileWhile() {
  boolean a = false;	
  while (true) { 
    int b = 5;
  }
  while (4 > 5) { 
    while (false)
      a = false;
    int b = 6;
  }
  boolean b = true;
  return b;
}
'
]

{ #category : #running }
JavaSmaCCWhileWhileMethodTest >> setUp [
	whileWhile := (self parseMethod: 'whileWhile') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileBodyContentType [
	self assert: whileWhile statements second body childrenNode first class equals: FASTStatementBlock
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileBodyParent [
	self assert: whileWhile statements second body parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileBodyType [
	self assert: whileWhile statements second body class equals: FASTJavaBodyStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileConditionContentType [
	self assert: whileWhile statements second condition childrenNode first class equals: FASTBooleanLiteral
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileConditionParent [
	self assert: whileWhile statements second condition parentNode equals: whileWhile statements second
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testFirstWhileConditionType [
	self assert: whileWhile statements second condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyContentType [
	self assert: whileWhile statements third body statements first body childrenNode first class equals: FASTExpressionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyParent [
	self assert: whileWhile statements third body statements first body parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileBodyType [
	self assert: whileWhile statements third body statements first body class equals: FASTJavaBodyStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileConditionContentType [
	self assert: whileWhile statements third body statements first condition childrenNode first class equals: FASTBooleanLiteral
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileConditionParent [
	self assert: whileWhile statements third body statements first condition parentNode equals: whileWhile statements third body statements first 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testNestedWhileConditionType [
	self assert: whileWhile statements third body statements first condition class equals: FASTJavaConditionStatement 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileBodyContentType [
	self assert: whileWhile statements third body childrenNode first class equals: FASTStatementBlock
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileBodyParent [
	self assert: whileWhile statements third body parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileBodyType [
	self assert: whileWhile statements third body class equals: FASTJavaBodyStatement 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileConditionContentType [
	self assert: whileWhile statements third condition childrenNode first class equals: FASTJavaInfixOperation
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileConditionParent [
	self assert: whileWhile statements third condition parentNode equals: whileWhile statements third 
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testSecondWhileConditionType [
	self assert: whileWhile statements third condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testStatementsCount [
	self assert: whileWhile statements size equals: 5
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testStatementsParent [
	whileWhile statements do: [ :each | self assert: each parentNode equals: whileWhile statementBlock ]
]

{ #category : #tests }
JavaSmaCCWhileWhileMethodTest >> testStatementsType [
	self
		assert: whileWhile statements first class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements second class equals: FASTJavaWhileStatement;
		assert: whileWhile statements third class equals: FASTJavaWhileStatement;
		assert: (whileWhile statements at: 4) class equals: FASTJavaVarDeclStatement;
		assert: whileWhile statements last class equals: FASTReturnStatement
]

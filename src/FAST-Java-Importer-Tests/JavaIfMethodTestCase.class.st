Class {
	#name : #JavaIfMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaIfMethodTestCase >> setUpMethods [
	ifMethod := self assembleFastMethodFromModelByName: 'ifMethod'
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstIfConditionParent [
	self assert: ifMethod statements first condition parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstIfConditionType [
	self assert: ifMethod statements first condition class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstIfElseAbsence [
	self assert: ifMethod statements first elsePart isNil 
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstIfThenParent [
	self assert: ifMethod statements first thenPart parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstIfThenType [
	self assert: ifMethod statements first thenPart class equals: FASTExpressionStatement 
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstSecondConditionParent [
	self assert: ifMethod statements last condition parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaIfMethodTestCase >> testFirstSecondConditionType [
	self assert: ifMethod statements last condition class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaIfMethodTestCase >> testSecondIfElseParent [
	self assert: ifMethod statements last elsePart parentNode equals: ifMethod statements last
]

{ #category : #tests }
JavaIfMethodTestCase >> testSecondIfElseType [
	self assert: ifMethod statements last elsePart class equals: FASTExpressionStatement
]

{ #category : #tests }
JavaIfMethodTestCase >> testSecondIfThenParent [
	self assert: ifMethod statements last thenPart parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaIfMethodTestCase >> testSecondIfThenType [
	self assert: ifMethod statements last thenPart class equals: FASTStatementBlock 
]

{ #category : #tests }
JavaIfMethodTestCase >> testStatementsCount [
	self assert: ifMethod statements size equals: 2
]

{ #category : #tests }
JavaIfMethodTestCase >> testStatementsParent [
	self
		assert: ifMethod statements first parentNode equals: ifMethod statementBlock;
		assert: ifMethod statements last  parentNode equals: ifMethod statementBlock;
		assert: ifMethod statementBlock parentNode equals: ifMethod 
]

{ #category : #tests }
JavaIfMethodTestCase >> testStatementsType [
	self
		assert: ifMethod statements first class equals: FASTJavaIfStatement;
		assert: ifMethod statements last class equals: FASTJavaIfStatement
]

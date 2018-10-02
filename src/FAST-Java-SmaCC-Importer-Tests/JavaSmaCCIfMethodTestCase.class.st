Class {
	#name : #JavaSmaCCIfMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCIfMethodTestCase >> setUpMethods [
	ifMethod := (self parseMethod: 'ifMethod') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstIfConditionParent [
	self assert: ifMethod statements first condition parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstIfConditionType [
	self assert: ifMethod statements first condition class equals: FASTJavaConditionStatement 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstIfElseAbsence [
	self assert: ifMethod statements first elsePart isNil 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstIfThenParent [
	self assert: ifMethod statements first thenPart parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstIfThenType [
	self assert: ifMethod statements first thenPart class equals: FASTJavaThenPartStatement 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstSecondConditionParent [
	self assert: ifMethod statements last condition parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testFirstSecondConditionType [
	self assert: ifMethod statements last condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testSecondIfElseParent [
	self assert: ifMethod statements last elsePart parentNode equals: ifMethod statements last
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testSecondIfElseType [
	self assert: ifMethod statements last elsePart class equals: FASTJavaElsePartStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testSecondIfThenParent [
	self assert: ifMethod statements last thenPart parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testSecondIfThenType [
	self assert: ifMethod statements last thenPart class equals: FASTJavaThenPartStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testStatementsCount [
	self assert: ifMethod statements size equals: 2
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testStatementsParent [
	self
		assert: ifMethod statements first parentNode equals: ifMethod statementBlock;
		assert: ifMethod statements last  parentNode equals: ifMethod statementBlock;
		assert: ifMethod statementBlock parentNode equals: ifMethod 
]

{ #category : #tests }
JavaSmaCCIfMethodTestCase >> testStatementsType [
	self
		assert: ifMethod statements first class equals: FASTJavaIfStatement;
		assert: ifMethod statements last class equals: FASTJavaIfStatement
]

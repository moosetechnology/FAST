Class {
	#name : #JavaSmaCCIfMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'ifMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCIfMethodTest >> methodIfMethod [
	^ 'void ifMethod() {
	if (true)
		return 4 + 5;
	if (false)
		{ int x = 2;	x = x + 3; }
		else 
			return 5 + 4;
	}'
]

{ #category : #running }
JavaSmaCCIfMethodTest >> setUp [
	super setUp.
	ifMethod := (self parseMethod: 'ifMethod') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstIfConditionParent [
	self assert: ifMethod statements first condition parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstIfConditionType [
	self assert: ifMethod statements first condition class equals: FASTJavaConditionStatement 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstIfElseAbsence [
	self assert: ifMethod statements first elsePart isNil 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstIfThenParent [
	self assert: ifMethod statements first thenPart parentNode equals: ifMethod statements first
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstIfThenType [
	self assert: ifMethod statements first thenPart class equals: FASTJavaThenPartStatement 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstSecondConditionParent [
	self assert: ifMethod statements last condition parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testFirstSecondConditionType [
	self assert: ifMethod statements last condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testSecondIfElseParent [
	self assert: ifMethod statements last elsePart parentNode equals: ifMethod statements last
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testSecondIfElseType [
	self assert: ifMethod statements last elsePart class equals: FASTJavaElsePartStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testSecondIfThenParent [
	self assert: ifMethod statements last thenPart parentNode equals: ifMethod statements last 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testSecondIfThenType [
	self assert: ifMethod statements last thenPart class equals: FASTJavaThenPartStatement
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testStatementsCount [
	self assert: ifMethod statements size equals: 2
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testStatementsParent [
	self
		assert: ifMethod statements first parentNode equals: ifMethod statementBlock;
		assert: ifMethod statements last  parentNode equals: ifMethod statementBlock;
		assert: ifMethod statementBlock parentNode equals: ifMethod 
]

{ #category : #tests }
JavaSmaCCIfMethodTest >> testStatementsType [
	self
		assert: ifMethod statements first class equals: FASTJavaIfStatement;
		assert: ifMethod statements last class equals: FASTJavaIfStatement
]

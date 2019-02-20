Class {
	#name : #JavaSmaCCConditionalStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodConditionalStatement'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCConditionalStatementTest >> methodConditionalStatement [
	^ 'void arrayAccess() {
   int result = (1>2) ? 4 :  5;
}'
]

{ #category : #running }
JavaSmaCCConditionalStatementTest >> setUp [
	super setUp.
	methodConditionalStatement := (self parseMethod: 'ConditionalStatement')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalContidionParent [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression condition parentNode equals: methodConditionalStatement statements anyOne declarators anyOne expression 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalContidionType [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression condition class equals: FASTJavaConditionStatement 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalElsePartParent [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression elsePart parentNode equals: methodConditionalStatement statements anyOne declarators anyOne expression
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalElsePartType [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression elsePart class equals: FASTJavaElsePartStatement
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalParent [ 
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression parentNode equals: methodConditionalStatement statements anyOne declarators anyOne 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalSize [
	self assert: (methodConditionalStatement mooseModel allWithType: FASTJavaConditionalStatement) size equals: 1 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalThenPartParent [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression thenPart parentNode equals: methodConditionalStatement statements anyOne declarators anyOne expression
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalThenPartType [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression thenPart class equals: FASTJavaThenPartStatement 
]

{ #category : #tests }
JavaSmaCCConditionalStatementTest >> testConditionalType [
	self assert: methodConditionalStatement statements anyOne declarators anyOne expression class equals: FASTJavaConditionalStatement 
]

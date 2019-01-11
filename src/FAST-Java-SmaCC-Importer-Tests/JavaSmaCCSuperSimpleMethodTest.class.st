Class {
	#name : #JavaSmaCCSuperSimpleMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCSuperSimpleMethodTest >> setUpMethods [
	supersimple := (self parseMethod: 'supersimple') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTest >> testExpressionParent [
	self assert: supersimple statements last expression parentNode equals: supersimple statements last
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTest >> testExpressionType [
	self assert: supersimple statements last expression class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTest >> testStatementsCount [
	self assert: supersimple statements size equals: 1
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTest >> testStatementsType [
	self assert: supersimple statements last class equals: FASTReturnStatement  
]

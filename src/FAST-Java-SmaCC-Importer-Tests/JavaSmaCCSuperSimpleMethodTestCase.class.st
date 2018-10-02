Class {
	#name : #JavaSmaCCSuperSimpleMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCSuperSimpleMethodTestCase >> setUpMethods [
	supersimple := (self parseMethod: 'supersimple') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTestCase >> testExpressionParent [
	self assert: supersimple statements last expression parentNode equals: supersimple statements last
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTestCase >> testExpressionType [
	self assert: supersimple statements last expression class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTestCase >> testStatementsCount [
	self assert: supersimple statements size equals: 1
]

{ #category : #tests }
JavaSmaCCSuperSimpleMethodTestCase >> testStatementsType [
	self assert: supersimple statements last class equals: FASTReturnStatement  
]

Class {
	#name : #JavaSuperSimpleMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaSuperSimpleMethodTestCase >> setUpMethods [
	supersimple := self assembleFastMethodFromModelByName: 'supersimple'
]

{ #category : #tests }
JavaSuperSimpleMethodTestCase >> testExpressionParent [
	self assert: supersimple statements last expression parentNode equals: supersimple statements last
]

{ #category : #tests }
JavaSuperSimpleMethodTestCase >> testExpressionType [
	self assert: supersimple statements last expression class equals: FASTBooleanLiteral 
]

{ #category : #tests }
JavaSuperSimpleMethodTestCase >> testStatementsCount [
	self assert: supersimple statements size equals: 1
]

{ #category : #tests }
JavaSuperSimpleMethodTestCase >> testStatementsType [
	self assert: supersimple statements last class equals: FASTReturnStatement  
]

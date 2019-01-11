Class {
	#name : #JavaSmaCCMethodCastTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodCastAndClassProperty'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCMethodCastTest >> setUpMethods [
	methodCastAndClassProperty := (self parseMethod: 'CastAndClassProperty')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastAsAReceiverOfAnInvocation [
	self assert: methodCastAndClassProperty statements third childrenNode first receiver class equals: FASTJavaCastExpression.
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastExpressionName [
	self
		assert: methodCastAndClassProperty statements third childrenNode first receiver expression fieldName
		equals: 'pListModel'
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastExpressionType [
	self
		assert: methodCastAndClassProperty statements third childrenNode first receiver expression class
		equals: FASTJavaClassProperty.
]

{ #category : #tests }
JavaSmaCCMethodCastTest >> testCastType [
	self assert: methodCastAndClassProperty statements third childrenNode first receiver type class equals: FASTNamedEntity.
	self assert: methodCastAndClassProperty statements third childrenNode first receiver type name equals: 'IEditableListModel'
]

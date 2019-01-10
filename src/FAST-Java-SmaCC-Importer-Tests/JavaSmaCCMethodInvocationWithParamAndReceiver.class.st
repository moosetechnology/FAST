Class {
	#name : #JavaSmaCCMethodInvocationWithParamAndReceiver,
	#superclass : #JavaSmaCCImporterTestCase,
	#instVars : [
		'methodMethodInvocationWithParamAndReceiver'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCMethodInvocationWithParamAndReceiver >> setUpMethods [
	methodMethodInvocationWithParamAndReceiver := (self parseMethod: 'methodInvocationWithParamAndReceiver')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiver >> testNumberOfArguments [
	self assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments size equals: 2.
	self assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver arguments size equals: 2
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiver >> testNumberOfMethodInvocations [
	self
		assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression class
		equals: FASTJavaMethodInvocation.
	self
		assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver class
		equals: FASTJavaMethodInvocation.
	self
		assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver receiver
		equals: nil
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiver >> testTypeOfArguments [
	self
		assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments first class
		equals: FASTJavaIntegerLiteral.
	self
		assert: methodMethodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments second class
		equals: FASTJavaIntegerLiteral
]

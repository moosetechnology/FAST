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

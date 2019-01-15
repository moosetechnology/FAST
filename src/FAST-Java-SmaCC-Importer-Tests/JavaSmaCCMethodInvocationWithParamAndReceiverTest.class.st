Class {
	#name : #JavaSmaCCMethodInvocationWithParamAndReceiverTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodInvocationWithClassPropertyAsReceiver',
		'methodInvocationWithParamAndReceiver',
		'methodInvocationWithVariableAsReceiver'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> setUpMethods [
	methodInvocationWithParamAndReceiver := (self parseMethod: 'InvocationWithParamAndReceiver')
		allFASTJavaMethodEntity first.
	methodInvocationWithVariableAsReceiver := (self parseMethod: 'InvocationWithVariableAsReceiver')
		allFASTJavaMethodEntity first.
		methodInvocationWithClassPropertyAsReceiver:= (self parseMethod: 'InvocationWithClassPropertyAsReceiver')
		allFASTJavaMethodEntity first.
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testClassPropertyReceiverMethodInvocations [
	self
		assert: methodInvocationWithClassPropertyAsReceiver statements first childrenNode first receiver class
		equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfArguments [
	self assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments size equals: 2.
	self assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver arguments size equals: 2
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testNumberOfMethodInvocations [
	self
		assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression class
		equals: FASTJavaMethodInvocation.
	self
		assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver class
		equals: FASTJavaMethodInvocation.
	self
		assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver receiver
		equals: nil
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverMethodInvocations [
	self
		assert:
			methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver
				class
		equals: FASTJavaMethodInvocation.
	self
		assert:
			methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression receiver
				receiver
		equals: nil.
	self
		assert: methodInvocationWithVariableAsReceiver statements first childrenNode first receiver class
		equals: FASTJavaIdentifier
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testTypeOfArguments [
	self
		assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments first class
		equals: FASTJavaIntegerLiteral.
	self
		assert: methodInvocationWithParamAndReceiver childrenNode second childrenNode first childrenNode first expression arguments second class
		equals: FASTJavaIntegerLiteral
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testVariableReceiverMethodInvocations [
	self
		assert: methodInvocationWithVariableAsReceiver statements first childrenNode first receiver class
		equals: FASTJavaIdentifier
]

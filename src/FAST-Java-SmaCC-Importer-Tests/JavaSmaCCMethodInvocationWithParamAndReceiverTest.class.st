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

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithClassPropertyAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	SampleCustomizableTableDefinitionRH.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithParamAndReceiver [
	^ 'public void onClick(ClickEvent arg0) {
		x = hello(a,b).hello2(1,2);
	}'
]

{ #category : #resources }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> methodInvocationWithVariableAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #running }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> setUp [
	super setUp.
	methodInvocationWithParamAndReceiver := (self
		parseMethod: 'InvocationWithParamAndReceiver') allFASTJavaMethodEntity first.
	methodInvocationWithVariableAsReceiver := (self
		parseMethod: 'InvocationWithVariableAsReceiver') allFASTJavaMethodEntity first.
	methodInvocationWithClassPropertyAsReceiver := (self
		parseMethod: 'InvocationWithClassPropertyAsReceiver') allFASTJavaMethodEntity first
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
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverIsInModel [
	self
		assert: methodInvocationWithVariableAsReceiver statements first childrenNode first receiver localMooseModel
		equals: methodInvocationWithVariableAsReceiver localMooseModel
]

{ #category : #tests }
JavaSmaCCMethodInvocationWithParamAndReceiverTest >> testReceiverKnowTheCallingMethod [
	self
		assert: methodInvocationWithVariableAsReceiver statements first childrenNode first receiver parentNode
		equals: methodInvocationWithVariableAsReceiver statements first childrenNode first
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

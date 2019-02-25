Class {
	#name : #JavaSmaCCThisConstructorInvocationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSuperConstructor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCThisConstructorInvocationTest >> methodThisConstructor [
	^ 'Patate () {
	this("Hello");
}'
]

{ #category : #running }
JavaSmaCCThisConstructorInvocationTest >> setUp [
	super setUp.
	methodSuperConstructor := (self parseMethod: 'ThisConstructor') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorArgumentsParent [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne parentNode equals: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorArgumentsSize [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorName [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne name equals: 'this'
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorParent [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne parentNode equals: methodSuperConstructor statementBlock 
]

{ #category : #tests }
JavaSmaCCThisConstructorInvocationTest >> testThisConstructorSize [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) size equals: 1
]

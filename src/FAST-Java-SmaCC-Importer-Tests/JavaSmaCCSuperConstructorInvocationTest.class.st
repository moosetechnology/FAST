Class {
	#name : #JavaSmaCCSuperConstructorInvocationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodSuperConstructor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSuperConstructorInvocationTest >> methodSuperConstructor [
	^ 'Patate () {
	super("Hello");
}'
]

{ #category : #running }
JavaSmaCCSuperConstructorInvocationTest >> setUp [
	super setUp.
	methodSuperConstructor := (self parseMethod: 'SuperConstructor') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsParent [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne parentNode equals: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorArgumentsSize [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorName [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne name equals: 'super'
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorParent [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) anyOne parentNode equals: methodSuperConstructor statementBlock 
]

{ #category : #tests }
JavaSmaCCSuperConstructorInvocationTest >> testSuperConstructorSize [
	self assert: (methodSuperConstructor mooseModel allWithType: FASTJavaMethodInvocation) size equals: 1
]

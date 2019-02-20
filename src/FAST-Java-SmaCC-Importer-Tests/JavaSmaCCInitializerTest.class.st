Class {
	#name : #JavaSmaCCInitializerTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodInitializer'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInitializerTest >> methodInitializer [
	^ 'void initializer() {
	Button b = new Button("param1") { 
	{ addClickListener(new ClickListener(){}); }
	 };
	}'
]

{ #category : #running }
JavaSmaCCInitializerTest >> setUp [
	super setUp.
	methodInitializer := (self parseMethod: 'initializer') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerAsChild [
	self assert: (methodInitializer mooseModel allWithType: FASTJavaInitializer) anyOne equals: methodInitializer statements anyOne declarators anyOne expression methods anyOne childrenNode anyOne
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerHasStatementBlock [
	self assert: (methodInitializer mooseModel allWithType: FASTJavaInitializer) anyOne statementBlock isNotNil
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerHasStatementBlockMethodSize [
	self assert: (methodInitializer mooseModel allWithType: FASTJavaInitializer) anyOne statementBlock statements size equals: 1
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerParent [
	self assert: (methodInitializer mooseModel allWithType: FASTJavaInitializer) anyOne parentNode equals: methodInitializer statements anyOne declarators anyOne expression methods anyOne 
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerSize [
	self assert: (methodInitializer mooseModel allWithType: FASTJavaInitializer) size equals: 1 
]

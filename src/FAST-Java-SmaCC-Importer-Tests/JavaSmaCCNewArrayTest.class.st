Class {
	#name : #JavaSmaCCNewArrayTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNewArray'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewArrayTest >> methodNewArray [
	^ 'void innerNewClass() {
	String[] s2 = new String[] { "a", "b", "c"};
	String[] s3 = new String[3];
}'
]

{ #category : #running }
JavaSmaCCNewArrayTest >> setUp [
	super setUp.
	methodNewArray := (self parseMethod: 'NewArray')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArrayAutoCreatedArrayInitializersParent [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) first initializers anyOne parentNode
		equals: (methodNewArray mooseModel allWithType: FASTJavaNewArray) first
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArrayAutoCreatedArrayInitializersSize [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) first initializers size equals: 3 
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArrayParent [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) first parentNode equals: methodNewArray statementBlock statements first declarators first.
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second parentNode equals: methodNewArray statementBlock statements second declarators first.
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySimpleArrayAsChild [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second equals: methodNewArray statementBlock statements second declarators first expression
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySimpleArrayParent [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second parentNode equals: methodNewArray statementBlock statements second declarators first
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySize [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second arguments size equals: 1
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeParent [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second arguments anyOne parentNode equals: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second 
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySimpleArraySizeType [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) second arguments anyOne class equals: FASTJavaIntegerLiteral 
]

{ #category : #tests }
JavaSmaCCNewArrayTest >> testNewArraySize [
	self assert: (methodNewArray mooseModel allWithType: FASTJavaNewArray) size equals: 2
]

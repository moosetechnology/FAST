Class {
	#name : #JavaSmaCCConstructorDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodConstructor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCConstructorDeclarationTest >> methodConstructor [
	^ 'ArrayAccess() {
		int i = 3;
		hello.hello();
}'
]

{ #category : #running }
JavaSmaCCConstructorDeclarationTest >> setUp [
	super setUp.
	methodConstructor := (self parseMethod: 'Constructor')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCConstructorDeclarationTest >> testConstructorName [
	self assert: methodConstructor name equals: 'ArrayAccess'
]

{ #category : #tests }
JavaSmaCCConstructorDeclarationTest >> testNumberOfStatements [
	self assert: methodConstructor statements size equals: 2
]

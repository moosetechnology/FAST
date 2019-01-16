Class {
	#name : #JavaSmaCCStringLiteral,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodStringLiteral'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCStringLiteral >> methodStringLiteral [
	^ 'public void patate () {
	print("Patate");
}'
]

{ #category : #running }
JavaSmaCCStringLiteral >> setUp [
	methodStringLiteral := (self parseMethod: 'stringLiteral') allFASTJavaMethodEntity
		first
]

{ #category : #running }
JavaSmaCCStringLiteral >> testStringLiteralType [
	self
		assert: methodStringLiteral statements first childrenNode first arguments first class
		equals: FASTJavaStringLiteral
]

{ #category : #running }
JavaSmaCCStringLiteral >> testStringLiteralValue [
	self
		assert: methodStringLiteral statements first childrenNode first arguments first value
		equals: 'Patate'
]

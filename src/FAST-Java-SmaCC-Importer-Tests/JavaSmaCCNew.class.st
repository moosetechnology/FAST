Class {
	#name : #JavaSmaCCNew,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNew >> methodNew [
	^ 'void newMethod() {
	new Patate("hello", world());
}'
]

{ #category : #resources }
JavaSmaCCNew >> setUp [
	methodNew := (self parseMethod: 'new') allFASTJavaMethodEntity first
]

{ #category : #resources }
JavaSmaCCNew >> testNewName [
	self assert: methodNew statements first childrenNode first name equals: 'Patate'
]

{ #category : #resources }
JavaSmaCCNew >> testNewType [
	self assert: methodNew statements first childrenNode first class equals: FASTJavaNewExpression
]

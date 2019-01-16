Class {
	#name : #JavaSmaCCFor,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodFor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCFor >> methodFor [
	^ 'void forMethod() {
	for (int i = 0;i< 3;++i){
		i++;
	}
}'
]

{ #category : #running }
JavaSmaCCFor >> setUpMethods [
	methodFor := (self parseMethod: 'for') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCFor >> testForEachBodyParentNode [
	self assert: methodFor statements first body parentNode equals: methodFor statements first
]

{ #category : #running }
JavaSmaCCFor >> testForEachBodyType [
	self assert: methodFor statements first body class equals: FASTJavaBodyStatement
]

{ #category : #running }
JavaSmaCCFor >> testForEachConditionParentNode [
	self assert: methodFor statements first condition parentNode equals: methodFor statements first
]

{ #category : #running }
JavaSmaCCFor >> testForEachConditionType [
	self assert: methodFor statements first condition class equals: FASTJavaConditionStatement
]

{ #category : #running }
JavaSmaCCFor >> testForEachIncrementorsParentNode [
	methodFor statements first incrementors do: [ :incrementor | self assert: incrementor parentNode equals: methodFor statements first ]
]

{ #category : #running }
JavaSmaCCFor >> testForEachIncrementorsType [
	methodFor statements first incrementors do: [ :incrementor | self assert: incrementor class equals: FASTJavaIncrementorsStatement ]
]

{ #category : #running }
JavaSmaCCFor >> testForEachInitializersParentNode [
	methodFor statements first initializers do: [ :initializer | self assert: initializer parentNode equals: methodFor statements first ]
]

{ #category : #running }
JavaSmaCCFor >> testForEachInitializersType [
	methodFor statements first initializers do: [ :initializer | self assert: initializer class equals: FASTJavaInitializersStatement ]
]

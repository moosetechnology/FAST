Class {
	#name : #JavaSmaCCForTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodFor'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCForTest >> methodFor [
	^ 'void forMethod() {
	for (int i = 0;i< 3;++i){
		i++;
	}
}'
]

{ #category : #running }
JavaSmaCCForTest >> setUp [
	super setUp.
	methodFor := (self parseMethod: 'for') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachBodyParentNode [
	self assert: methodFor statements first body parentNode equals: methodFor statements first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachBodyType [
	self assert: methodFor statements first body class equals: FASTJavaBodyStatement
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachConditionParentNode [
	self assert: methodFor statements first condition parentNode equals: methodFor statements first
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachConditionType [
	self assert: methodFor statements first condition class equals: FASTJavaConditionStatement
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachIncrementorsParentNode [
	methodFor statements first incrementors do: [ :incrementor | self assert: incrementor parentNode equals: methodFor statements first ]
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachIncrementorsType [
	methodFor statements first incrementors do: [ :incrementor | self assert: incrementor class equals: FASTJavaIncrementorsStatement ]
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachInitializersParentNode [
	methodFor statements first initializers do: [ :initializer | self assert: initializer parentNode equals: methodFor statements first ]
]

{ #category : #tests }
JavaSmaCCForTest >> testForEachInitializersType [
	methodFor statements first initializers do: [ :initializer | self assert: initializer class equals: FASTJavaInitializersStatement ]
]

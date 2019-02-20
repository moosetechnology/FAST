Class {
	#name : #JavaSmaCCArrayAccessTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodArrayAccess'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCArrayAccessTest >> methodArrayAccess [
	^ 'void arrayAccess() {
   int j = array1[i];
   int k = array2[i][j];
}'
]

{ #category : #running }
JavaSmaCCArrayAccessTest >> setUp [
	super setUp.
	methodArrayAccess := (self parseMethod: 'ArrayAccess')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCArrayAccessTest >> testArrayAccessParent [
	self assert: methodArrayAccess statements first declarators anyOne expression array parentNode equals: methodArrayAccess statements first declarators anyOne expression.
]

{ #category : #tests }
JavaSmaCCArrayAccessTest >> testNamedEntityName [
	self assert: methodArrayAccess statements first declarators anyOne expression array name equals: 'array1'.
	self assert: methodArrayAccess statements second declarators anyOne expression array array name equals: 'array2'.
]

{ #category : #tests }
JavaSmaCCArrayAccessTest >> testNumberOfarrayAccess [
	self assert: (methodArrayAccess mooseModel allWithType: FASTJavaArrayAccess) size equals: 3
]

{ #category : #tests }
JavaSmaCCArrayAccessTest >> testSubArrayType [
	self assert: methodArrayAccess statements second declarators anyOne expression array class equals: FASTJavaArrayAccess.
	self assert: methodArrayAccess statements second declarators anyOne expression array array class equals: FASTNamedEntity.
]

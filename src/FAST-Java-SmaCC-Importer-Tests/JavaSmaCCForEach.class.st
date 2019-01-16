Class {
	#name : #JavaSmaCCForEach,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodForEach'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCForEach >> methodForEach [
	^ 'void forEachMethod() {
	for(HandlerRegistration hr: SamplePageInputsAndLabels.this.hrList) {
		hr.removeHandler();
	}
}'
]

{ #category : #running }
JavaSmaCCForEach >> setUpMethods [
	methodForEach := (self parseMethod: 'forEach') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCForEach >> testForEachBodyParentNode [
		self assert: methodForEach statements first body parentNode equals: methodForEach statements first
]

{ #category : #running }
JavaSmaCCForEach >> testForEachBodyType [
	self assert: methodForEach statements first body class equals: FASTStatementBlock 
]

{ #category : #running }
JavaSmaCCForEach >> testForEachFieldName [
	self assert: methodForEach statements first fieldname name equals: 'hr'
]

{ #category : #running }
JavaSmaCCForEach >> testForEachFieldNameParent [
	self assert: methodForEach statements first fieldname parentNode equals: methodForEach statements first
]

{ #category : #running }
JavaSmaCCForEach >> testForEachFieldNameType [
	self assert: methodForEach statements first fieldname class equals: FASTNamedEntity 
]

{ #category : #running }
JavaSmaCCForEach >> testForEachListParent [
	self assert: methodForEach statements first list parentNode equals: methodForEach statements first
]

{ #category : #running }
JavaSmaCCForEach >> testForEachListType [
	self assert: methodForEach statements first list class equals: FASTJavaClassProperty
]

{ #category : #running }
JavaSmaCCForEach >> testForEachType [
	self assert: methodForEach statements first class equals: FASTJavaForEachStatement
]

{ #category : #running }
JavaSmaCCForEach >> testForEachTypeName [
	self assert: methodForEach statements first type name equals: 'HandlerRegistration'
]

{ #category : #running }
JavaSmaCCForEach >> testForEachTypeType [
	self assert: methodForEach statements first type class equals: FASTNamedEntity
]

Class {
	#name : #JavaSmaCCForEachTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodForEach'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCForEachTest >> methodForEach [
	^ 'void forEachMethod() {
	for(HandlerRegistration hr: SamplePageInputsAndLabels.hrList) {
		hr.removeHandler();
	}
}'
]

{ #category : #running }
JavaSmaCCForEachTest >> setUp [
	super setUp.
	methodForEach := (self parseMethod: 'forEach') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachBodyParentNode [
		self assert: methodForEach statements first body parentNode equals: methodForEach statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachBodyType [
	self assert: methodForEach statements first body class equals: FASTStatementBlock 
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldName [
	self assert: methodForEach statements first fieldname name equals: 'hr'
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldNameParent [
	self assert: methodForEach statements first fieldname parentNode equals: methodForEach statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldNameType [
	self assert: methodForEach statements first fieldname class equals: FASTNamedEntity 
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachListParent [
	self assert: methodForEach statements first list parentNode equals: methodForEach statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachListType [
	self assert: methodForEach statements first list class equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachType [
	self assert: methodForEach statements first class equals: FASTJavaForEachStatement
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachTypeName [
	self assert: methodForEach statements first type name equals: 'HandlerRegistration'
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachTypeType [
	self assert: methodForEach statements first type class equals: FASTNamedEntity
]

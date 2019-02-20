Class {
	#name : #JavaSmaCCOuterThisTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodOuterThis'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCOuterThisTest >> methodOuterThis [
	^ 'void outerThis() {
	call(Hello.this);
}'
]

{ #category : #running }
JavaSmaCCOuterThisTest >> setUp [
	super setUp.
	methodOuterThis := (self parseMethod: 'OuterThis') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisAsChild [
	self assert: (methodOuterThis mooseModel allWithType: FASTJavaOuterThis) anyOne equals: methodOuterThis statements anyOne expression arguments anyOne
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisParent [
	self assert: (methodOuterThis mooseModel allWithType: FASTJavaOuterThis) anyOne parentNode equals: methodOuterThis statements anyOne expression
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisSize [
	self assert: (methodOuterThis mooseModel allWithType: FASTJavaOuterThis ) size equals: 1
]

{ #category : #tests }
JavaSmaCCOuterThisTest >> testOuterThisType [
	self assert: (methodOuterThis mooseModel allWithType: FASTJavaOuterThis) anyOne type name equals: 'Hello'
]

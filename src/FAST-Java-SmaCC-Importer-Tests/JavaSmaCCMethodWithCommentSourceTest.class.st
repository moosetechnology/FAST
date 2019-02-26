Class {
	#name : #JavaSmaCCMethodWithCommentSourceTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodContinue'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCMethodWithCommentSourceTest >> methodContinue [
	^ '//Hello
public void ifContinue() {}'
]

{ #category : #running }
JavaSmaCCMethodWithCommentSourceTest >> setUp [
	super setUp.
	methodContinue := (self parseMethod: 'Continue')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCMethodWithCommentSourceTest >> testContinueSourceText [
	self assert: (methodContinue mooseModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self methodContinue
]

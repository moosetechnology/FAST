Class {
	#name : #JavaSmaCCContinueTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodContinue'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCContinueTest >> methodContinue [
	^ 'public void ifContinue() {
		if (true){
			continue;
		}
}'
]

{ #category : #running }
JavaSmaCCContinueTest >> setUp [
	super setUp.
	methodContinue := (self parseMethod: 'Continue')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCContinueTest >> testContinueParent [
	self assert: (methodContinue mooseModel allWithType: FASTJavaContinueStatement) anyOne parentNode equals: methodContinue statements anyOne thenPart childrenNode anyOne
]

{ #category : #tests }
JavaSmaCCContinueTest >> testContinueSize [
	self assert: (methodContinue mooseModel allWithType: FASTJavaContinueStatement) size equals: 1 
]

Class {
	#name : #JavaSmaCCTryCatchesTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'tryCatchMethod',
		'tryCatchesMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryCatchesTest >> methodTryCatches [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   }
	catch (PatateException e) {
		Patate.displayError(e.getMessage());
	} 
	catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #running }
JavaSmaCCTryCatchesTest >> setUp [
	super setUp.
	tryCatchesMethod := (self parseMethod: 'tryCatches') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchBodyType [
	self assert: tryCatchesMethod statements second catches first body class equals: FASTStatementBlock
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchNumber [
	self assert: tryCatchesMethod statements second catches size equals: 2.

]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersName [
	self assert: tryCatchesMethod statements second catches first parameters first name equals: 'e'
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchCatchParametersType [
	self assert: tryCatchesMethod statements second catches first parameters first class equals: FASTNamedEntity
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchTryPartType [
	self assert: tryCatchesMethod statements second try class equals: FASTJavaTryPartStatement
]

{ #category : #tests }
JavaSmaCCTryCatchesTest >> testTryCatchType [
	self assert: tryCatchesMethod statements second class equals: FASTJavaTryCatchStatement
]

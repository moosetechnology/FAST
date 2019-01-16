Class {
	#name : #JavaSmaCCTryCatch,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'tryCatchMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCTryCatch >> methodTryCatch [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #running }
JavaSmaCCTryCatch >> setUpMethods [
	tryCatchMethod := (self parseMethod: 'tryCatch') allFASTJavaMethodEntity first
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchCatchBodyType [
	self assert: tryCatchMethod statements second catches first body class equals: FASTStatementBlock
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchCatchNumber [
	self assert: tryCatchMethod statements second catches size equals: 1
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchCatchParametersName [
	self
		assert: tryCatchMethod statements second catches first parameters first name
		equals: 'e'
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchCatchParametersType [
	self
		assert: tryCatchMethod statements second catches first parameters first class
		equals: FASTNamedEntity
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchTryPartType [
	self assert: tryCatchMethod statements second try class equals: FASTJavaTryPartStatement
]

{ #category : #running }
JavaSmaCCTryCatch >> testTryCatchType [
	self assert: tryCatchMethod statements second class equals: FASTJavaTryCatchStatement
]

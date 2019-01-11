Class {
	#name : #JavaSmaCCTryCatch,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'tryCatchMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCTryCatch >> setUpMethods [
	tryCatchMethod := (self parseMethod: 'tryCatch') allFASTJavaMethodEntity first
]

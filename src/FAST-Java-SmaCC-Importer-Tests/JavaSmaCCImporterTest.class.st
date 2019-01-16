Class {
	#name : #JavaSmaCCImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCImporterTest >> parseMethod: methodName [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: (self perform: (#method, methodName capitalized) asSymbol ) 
]

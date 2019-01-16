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

{ #category : #running }
JavaSmaCCImporterTest >> setUp [
	
	
	self setUpMethods.

]

{ #category : #running }
JavaSmaCCImporterTest >> setUpMethods [
	"Let to subclasses for optimizing the time of exectution of the tests"
	self subclassResponsibility 
]

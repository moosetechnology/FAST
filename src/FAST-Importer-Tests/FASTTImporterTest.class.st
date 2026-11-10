"
I test the default behavior of the importer API trait using FASTExampleImporter.
"
Class {
	#name : 'FASTTImporterTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
}

{ #category : 'tests' }
FASTTImporterTest >> testHandlesFileIgnoresExtensionCase [

	self assert: (FASTExampleImporter handlesFile: '/folder/file.EX' asFileReference).
	self deny: (FASTExampleImporter handlesFile: '/folder/file.other' asFileReference)
]

{ #category : 'tests' }
FASTTImporterTest >> testParseFileIntoReadsTheFileContents [

	| file model |
	file := FileSystem memory / 'file.ex'.
	file writeStreamDo: [ :stream | stream nextPutAll: 'source' ].
	model := Object new.
	self assert: (FASTExampleImporter parseFile: file into: model) equals: {
			'source'.
			model }
]

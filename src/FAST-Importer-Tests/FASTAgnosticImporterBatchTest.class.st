"
I test the batch import of FASTAgnosticImporter: files and folders become one model per language, and the files without importer are answered under nil.
"
Class {
	#name : 'FASTAgnosticImporterBatchTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests-Tests',
	#package : 'FAST-Importer-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FASTAgnosticImporterBatchTest >> testNeverLoadLeavesTheMissingImporterUnloaded [

	| file result loadsBefore |
	file := FileSystem memory / 'data.stubext'.
	file writeStreamDo: [ :stream | stream nextPutAll: 'data' ].
	loadsBefore := FASTLoadableStubDescription loadCount.
	result := (FASTAgnosticImporter new
		           missingImporterStrategy: FASTNeverLoadStrategy new;
		           yourself) parseFiles: { file }.
	self assert: (result at: nil) asArray equals: { file }.
	self assert: FASTLoadableStubDescription loadCount equals: loadsBefore
]

{ #category : 'tests' }
FASTAgnosticImporterBatchTest >> testParseFilesBuildsOneModelPerLanguage [

	| fileSystem result loneModel |
	fileSystem := FileSystem memory.
	fileSystem / 'A.lone' writeStreamDo: [ :stream | stream nextPutAll: 'first' ].
	fileSystem / 'B.lone' writeStreamDo: [ :stream | stream nextPutAll: 'second' ].
	fileSystem / 'notes.txt' writeStreamDo: [ :stream | stream nextPutAll: 'not code' ].
	result := FASTAgnosticImporter new parseFiles: {
			          (fileSystem / 'A.lone').
			          (fileSystem / 'B.lone').
			          (fileSystem / 'notes.txt') }.
	self assert: result size equals: 2.
	self assert: (result at: nil) equals: (OrderedCollection with: fileSystem / 'notes.txt').
	loneModel := result keys detect: [ :model | model isNotNil ].
	self assert: loneModel asArray equals: { 'first'. 'second' }.
	self assert: (result at: loneModel) asArray equals: {
			(fileSystem / 'A.lone').
			(fileSystem / 'B.lone') }
]

{ #category : 'tests' }
FASTAgnosticImporterBatchTest >> testParseFolderImportsTheFilesOfTheFolder [

	| fileSystem result |
	fileSystem := FileSystem memory.
	(fileSystem / 'src') ensureCreateDirectory.
	fileSystem / 'src' / 'A.lone' writeStreamDo: [ :stream | stream nextPutAll: 'first' ].
	fileSystem / 'src' / 'B.lone' writeStreamDo: [ :stream | stream nextPutAll: 'second' ].
	result := FASTAgnosticImporter parseFolder: fileSystem / 'src'.
	self assert: result size equals: 1.
	self assert: result keys anyOne size equals: 2
]

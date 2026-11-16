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

	| fileSystem result javaModel |
	fileSystem := FileSystem memory.
	fileSystem / 'A.java' writeStreamDo: [ :stream | stream nextPutAll: 'public class A { }' ].
	fileSystem / 'B.java' writeStreamDo: [ :stream | stream nextPutAll: 'public class B { }' ].
	fileSystem / 'style.css' writeStreamDo: [ :stream | stream nextPutAll: 'a { color: red }' ].
	fileSystem / 'notes.txt' writeStreamDo: [ :stream | stream nextPutAll: 'not code' ].
	result := FASTAgnosticImporter new parseFiles: {
			          (fileSystem / 'A.java').
			          (fileSystem / 'B.java').
			          (fileSystem / 'style.css').
			          (fileSystem / 'notes.txt') }.
	self assert: result size equals: 3.
	self assert: (result at: nil) equals: (OrderedCollection with: fileSystem / 'notes.txt').
	javaModel := result keys detect: [ :model | model isNotNil and: [ (model allWithType: FASTJavaClassDeclaration) size = 2 ] ].
	self assert: (result at: javaModel) asArray equals: {
			(fileSystem / 'A.java').
			(fileSystem / 'B.java') }
]

{ #category : 'tests' }
FASTAgnosticImporterBatchTest >> testParseFolderImportsTheFilesOfTheFolder [

	| fileSystem result |
	fileSystem := FileSystem memory.
	(fileSystem / 'src') ensureCreateDirectory.
	fileSystem / 'src' / 'A.java' writeStreamDo: [ :stream | stream nextPutAll: 'public class A { }' ].
	fileSystem / 'src' / 'B.java' writeStreamDo: [ :stream | stream nextPutAll: 'public class B { }' ].
	result := FASTAgnosticImporter parseFolder: fileSystem / 'src'.
	self assert: result size equals: 1.
	self assert: (result keys anyOne allWithType: FASTJavaClassDeclaration) size equals: 2
]

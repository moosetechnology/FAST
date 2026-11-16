"
I test that FASTAgnosticImporter loads the project of a description when no importer handles a file, without asking the user when not interactive, and does not load it when the user declines.
"
Class {
	#name : 'FASTMissingProjectLoadingTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
}

{ #category : 'tests' }
FASTMissingProjectLoadingTest >> testDoesNotLoadWhenTheUserDeclines [

	| loadsBefore |
	loadsBefore := FASTLoadableStubDescription loadCount.
	self deny: (FASTDecliningAgnosticImporter new loadMissingImporterFor: 'data.stubext' asFileReference interactive: true).
	self assert: FASTLoadableStubDescription loadCount equals: loadsBefore
]

{ #category : 'tests' }
FASTMissingProjectLoadingTest >> testLoadsTheProjectWhenNotInteractive [

	| loadsBefore |
	loadsBefore := FASTLoadableStubDescription loadCount.
	self assert: (FASTAgnosticImporter new loadMissingImporterFor: 'data.stubext' asFileReference interactive: false).
	self assert: FASTLoadableStubDescription loadCount equals: loadsBefore + 1
]

"
I test that FASTAgnosticImporter loads the project of a description when no importer handles a file, without asking the user when not interactive, and does not load it when the user declines.
"
Class {
	#name : 'FASTMissingProjectLoadingTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests-Tests',
	#package : 'FAST-Importer-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FASTMissingProjectLoadingTest >> testDoesNotLoadWhenTheStrategyForbidsIt [

	| loadsBefore |
	loadsBefore := FASTLoadableStubDescription loadCount.
	self deny: (FASTAgnosticImporter new
			 missingImporterStrategy: FASTNeverLoadStrategy new;
			 loadMissingImporterFor: 'data.stubext' asFileReference).
	self assert: FASTLoadableStubDescription loadCount equals: loadsBefore
]

{ #category : 'tests' }
FASTMissingProjectLoadingTest >> testLoadsTheProjectWhenTheStrategyAllowsIt [

	| loadsBefore |
	loadsBefore := FASTLoadableStubDescription loadCount.
	self assert: (FASTAgnosticImporter new
			 missingImporterStrategy: FASTAlwaysLoadStrategy new;
			 loadMissingImporterFor: 'data.stubext' asFileReference).
	self assert: FASTLoadableStubDescription loadCount equals: loadsBefore + 1
]

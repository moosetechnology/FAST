"
I test that a description tells whether its project is loaded from the presence of its importer class.
"
Class {
	#name : 'FASTImporterDescriptionTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests-Tests',
	#package : 'FAST-Importer-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FASTImporterDescriptionTest >> testIsProjectLoadedChecksTheImportersOfTheExtensions [

	self assert: FASTLoneImporterDescription isProjectLoaded.
	self deny: FASTMissingImporterDescription isProjectLoaded
]

"
I test that a description tells whether its project is loaded from the presence of its importer class.
"
Class {
	#name : 'FASTImporterDescriptionTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
}

{ #category : 'tests' }
FASTImporterDescriptionTest >> testIsProjectLoadedChecksTheImportersOfTheExtensions [

	self assert: FASTJavaImporterDescription isProjectLoaded.
	self deny: FASTMissingImporterDescription isProjectLoaded
]

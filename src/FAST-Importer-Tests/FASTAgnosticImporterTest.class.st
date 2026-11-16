"
I test that FASTAgnosticImporter chooses the importer of a file by its extension, refuses files that no importer handles and reports importers that are ambiguous.
"
Class {
	#name : 'FASTAgnosticImporterTest',
	#superclass : 'TestCase',
	#category : 'FAST-Importer-Tests-Tests',
	#package : 'FAST-Importer-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FASTAgnosticImporterTest >> testDoesNotLoadAProjectForAnUnknownExtension [

	self deny: (FASTAgnosticImporter new loadMissingImporterFor: 'notes.unknownext' asFileReference)
]

{ #category : 'tests' }
FASTAgnosticImporterTest >> testFindsTheImporterOfAFileByItsExtension [

	self assert: (FASTAgnosticImporter importerFor: 'Main.lone' asFileReference) identicalTo: FASTExampleLoneImporter
]

{ #category : 'tests' }
FASTAgnosticImporterTest >> testRefusesAFileNoImporterHandles [

	self should: [ FASTAgnosticImporter importerFor: 'notes.txt' asFileReference ] raise: Error
]

{ #category : 'tests' }
FASTAgnosticImporterTest >> testSeveralImportersForAnExtensionAreAmbiguous [

	self should: [ FASTAgnosticImporter importerFor: 'file.ex' asFileReference ] raise: FASTAmbiguousImporterError
]

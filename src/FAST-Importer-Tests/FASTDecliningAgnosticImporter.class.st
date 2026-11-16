"
I simulate a user who declines to load a project, to test the interactive path of FASTAgnosticImporter.
"
Class {
	#name : 'FASTDecliningAgnosticImporter',
	#superclass : 'FASTAgnosticImporter',
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
}

{ #category : 'importing' }
FASTDecliningAgnosticImporter >> confirmLoading: aDescription for: aFileReference [
	"Simulates a user who declines the loading"

	^ false
]

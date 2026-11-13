"
I am signaled when several importers handle the extension of a file, so that FASTAgnosticImporter cannot choose one. My candidates are the importer classes that match.
"
Class {
	#name : 'FASTAmbiguousImporterError',
	#superclass : 'Error',
	#instVars : [
		'candidates'
	],
	#category : 'FAST-Importer',
	#package : 'FAST-Importer'
}

{ #category : 'accessing' }
FASTAmbiguousImporterError >> candidates [
	"The importer classes that handle the file"

	^ candidates
]

{ #category : 'accessing' }
FASTAmbiguousImporterError >> candidates: anObject [

	candidates := anObject
]

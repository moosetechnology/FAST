"
I never load a project: the files that need it are not imported.
"
Class {
	#name : 'FASTNeverLoadStrategy',
	#superclass : 'FASTMissingImporterStrategy',
	#category : 'FAST-Importer-Strategies',
	#package : 'FAST-Importer',
	#tag : 'Strategies'
}

{ #category : 'deciding' }
FASTNeverLoadStrategy >> allowsLoadingOf: aDescription for: aFileReference [
	"Never allow the loading"

	^ false
]

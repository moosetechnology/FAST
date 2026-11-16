"
I load the project of a description without asking the user. Use me to bypass the loading dialog.
"
Class {
	#name : 'FASTAlwaysLoadStrategy',
	#superclass : 'FASTMissingImporterStrategy',
	#category : 'FAST-Importer-Strategies',
	#package : 'FAST-Importer',
	#tag : 'Strategies'
}

{ #category : 'deciding' }
FASTAlwaysLoadStrategy >> allowsLoadingOf: aDescription for: aFileReference [
	"Always allow the loading"

	^ true
]

"
I decide whether FASTAgnosticImporter may load the project of a description when no loaded importer handles a file. My subclasses are the strategies: FASTAskOrLoadStrategy, FASTAlwaysLoadStrategy and FASTNeverLoadStrategy. Set the strategy of an importer with FASTAgnosticImporter>>missingImporterStrategy:.
"
Class {
	#name : 'FASTMissingImporterStrategy',
	#superclass : 'Object',
	#category : 'FAST-Importer-Strategies',
	#package : 'FAST-Importer',
	#tag : 'Strategies'
}

{ #category : 'deciding' }
FASTMissingImporterStrategy >> allowsLoadingOf: aDescription for: aFileReference [
	"Answer whether the project of the description may be loaded to import the file"

	^ self subclassResponsibility
]

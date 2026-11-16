"
I ask the user before loading a project in an interactive image, with a Spec dialog, and load it otherwise. This is the default strategy.
"
Class {
	#name : 'FASTAskOrLoadStrategy',
	#superclass : 'FASTMissingImporterStrategy',
	#category : 'FAST-Importer-Strategies',
	#package : 'FAST-Importer',
	#tag : 'Strategies'
}

{ #category : 'deciding' }
FASTAskOrLoadStrategy >> allowsLoadingOf: aDescription for: aFileReference [
	"Load without asking when the image is not interactive, otherwise ask the user"

	^ Smalltalk isInteractive
		  ifTrue: [
				  SpConfirmDialog new
					  title: 'Load a project';
					  message: 'Load ' , aDescription baselineName , ' to import ' , aFileReference basename , '?';
					  openModal ]
		  ifFalse: [ true ]
]

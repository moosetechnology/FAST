"
I am an importer for the extension lone, used to test FASTAgnosticImporter without any language project. My model is the collection of the sources I imported.
"
Class {
	#name : 'FASTExampleLoneImporter',
	#superclass : 'FASTExampleImporter',
	#category : 'FAST-Importer-Tests-Stubs',
	#package : 'FAST-Importer-Tests',
	#tag : 'Stubs'
}

{ #category : 'accessing' }
FASTExampleLoneImporter class >> extensions [
	"File extensions without the dot that the importer handles"

	^ #( 'lone' )
]

{ #category : 'importing' }
FASTExampleLoneImporter >> parse: aString into: aModel [
	"Import the source in the collection given, or in a new collection, and answer it"

	| model |
	model := aModel ifNil: [ OrderedCollection new ].
	model add: aString.
	^ model
]

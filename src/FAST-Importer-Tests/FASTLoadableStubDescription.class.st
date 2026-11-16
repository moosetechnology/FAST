"
I describe a project that is loaded by counting its loads, to test FASTAgnosticImporter without network access.
"
Class {
	#name : 'FASTLoadableStubDescription',
	#superclass : 'FASTImporterDescription',
	#classVars : [
		'LoadCount'
	],
	#category : 'FAST-Importer-Tests-Stubs',
	#package : 'FAST-Importer-Tests',
	#tag : 'Stubs'
}

{ #category : 'accessing' }
FASTLoadableStubDescription class >> baselineName [

	^ 'LoadableStub'
]

{ #category : 'accessing' }
FASTLoadableStubDescription class >> extensions [

	^ #( 'stubext' )
]

{ #category : 'accessing' }
FASTLoadableStubDescription class >> loadCount [

	^ LoadCount ifNil: [ 0 ]
]

{ #category : 'actions' }
FASTLoadableStubDescription class >> loadProject [

	LoadCount := self loadCount + 1
]

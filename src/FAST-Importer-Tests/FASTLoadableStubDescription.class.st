Class {
	#name : 'FASTLoadableStubDescription',
	#superclass : 'FASTImporterDescription',
	#classVars : [
		'LoadCount'
	],
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
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

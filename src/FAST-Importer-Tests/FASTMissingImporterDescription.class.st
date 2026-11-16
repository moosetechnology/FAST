"
I describe a project whose importer is never present, to test that FASTImporterDescription detects a project that is not loaded.
"
Class {
	#name : 'FASTMissingImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Tests-Stubs',
	#package : 'FAST-Importer-Tests',
	#tag : 'Stubs'
}

{ #category : 'accessing' }
FASTMissingImporterDescription class >> baselineName [

	^ 'Missing'
]

{ #category : 'accessing' }
FASTMissingImporterDescription class >> extensions [

	^ #(  )
]

"
I describe the project of FASTExampleLoneImporter, to test that a description is loaded when its importer is present.
"
Class {
	#name : 'FASTLoneImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Tests-Stubs',
	#package : 'FAST-Importer-Tests',
	#tag : 'Stubs'
}

{ #category : 'accessing' }
FASTLoneImporterDescription class >> baselineName [

	^ 'Lone'
]

{ #category : 'accessing' }
FASTLoneImporterDescription class >> extensions [

	^ #( 'lone' )
]

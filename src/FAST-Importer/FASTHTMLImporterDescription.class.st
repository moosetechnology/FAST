"
I describe the FAST HTML importer, hosted in the FASTHTML repository and loaded with the FASTHTML baseline. Its sources are at the root of the repository. I handle HTML source files.
"
Class {
	#name : 'FASTHTMLImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> baselineName [

	^ 'FASTHTML'
]

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> extensions [

	^ #( 'html' )
]

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> githubOrganisation [

	^ 'Evref-BL'
]

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTHTMLImporterDescription class >> projectName [

	^ 'FAST-HTML'
]

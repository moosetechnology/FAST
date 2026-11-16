"
I describe the FAST XML importer, hosted in the FASTXML repository and loaded with the FASTXML baseline. Its sources are at the root of the repository. I handle XML source files.
"
Class {
	#name : 'FASTXMLImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTXMLImporterDescription class >> baselineName [

	^ 'FASTXML'
]

{ #category : 'accessing' }
FASTXMLImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTXMLImporterDescription class >> extensions [

	^ #( 'xml' )
]

{ #category : 'accessing' }
FASTXMLImporterDescription class >> githubOrganisation [

	^ 'Evref-BL'
]

{ #category : 'accessing' }
FASTXMLImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTXMLImporterDescription class >> projectName [

	^ 'FAST-XML'
]

"
I describe the FAST CSS importer, hosted in the FASTCSS repository and loaded with the FASTCSS baseline. Its sources are at the root of the repository. I handle CSS source files.
"
Class {
	#name : 'FASTCSSImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTCSSImporterDescription class >> baselineName [

	^ 'FASTCSS'
]

{ #category : 'accessing' }
FASTCSSImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTCSSImporterDescription class >> extensions [

	^ #( 'css' )
]

{ #category : 'accessing' }
FASTCSSImporterDescription class >> githubOrganisation [

	^ 'Evref-BL'
]

{ #category : 'accessing' }
FASTCSSImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTCSSImporterDescription class >> projectName [

	^ 'FAST-CSS'
]

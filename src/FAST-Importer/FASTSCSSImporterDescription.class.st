"
I describe the FAST SCSS importer, hosted in the FASTSCSS repository and loaded with the FASTSCSS baseline. Its sources are at the root of the repository. I handle SCSS source files.
"
Class {
	#name : 'FASTSCSSImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> baselineName [

	^ 'FASTSCSS'
]

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> extensions [

	^ #( 'scss' )
]

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> githubOrganisation [

	^ 'Evref-BL'
]

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTSCSSImporterDescription class >> projectName [

	^ 'FAST-SCSS'
]

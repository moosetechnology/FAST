"
I describe the FAST YAML importer, hosted in the FASTYAML repository and loaded with the FASTYAML baseline. Its sources are at the root of the repository. I handle YAML source files.
"
Class {
	#name : 'FASTYAMLImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> baselineName [

	^ 'FASTYAML'
]

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> extensions [

	^ #( 'yml' )
]

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> githubOrganisation [

	^ 'Evref-BL'
]

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTYAMLImporterDescription class >> projectName [

	^ 'FAST-YAML'
]

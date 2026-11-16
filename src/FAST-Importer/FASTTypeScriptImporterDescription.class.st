"
I describe the FAST TypeScript importer, hosted in the FASTTypescript repository and loaded with the FASTTypeScript baseline. Its sources are at the root of the repository. I handle TypeScript source files. The importer is known to be broken against the current Pharo-Tree-Sitter, so I am only a description for now.
"
Class {
	#name : 'FASTTypeScriptImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTTypeScriptImporterDescription class >> baselineName [

	^ 'FASTTypeScript'
]

{ #category : 'accessing' }
FASTTypeScriptImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTTypeScriptImporterDescription class >> extensions [

	^ #( 'ts' )
]

{ #category : 'accessing' }
FASTTypeScriptImporterDescription class >> group [

	^ 'tools'
]

{ #category : 'accessing' }
FASTTypeScriptImporterDescription class >> projectName [

	^ 'FASTTypescript'
]

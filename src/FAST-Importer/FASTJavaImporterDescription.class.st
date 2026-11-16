"
I describe the FAST Java importer, hosted in the FAST-JAVA repository and loaded with the FASTJava baseline. I handle Java source files.
"
Class {
	#name : 'FASTJavaImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTJavaImporterDescription class >> baselineName [

	^ 'FASTJava'
]

{ #category : 'accessing' }
FASTJavaImporterDescription class >> branch [

	^ 'v4'
]

{ #category : 'accessing' }
FASTJavaImporterDescription class >> extensions [

	^ #( 'java' )
]

{ #category : 'accessing' }
FASTJavaImporterDescription class >> group [

	^ 'smacc'
]

{ #category : 'accessing' }
FASTJavaImporterDescription class >> projectName [

	^ 'FAST-JAVA'
]

"
I describe the FAST Python importer, hosted in the FAST-Python repository and loaded with the FASTPython baseline. I handle Python source files.
"
Class {
	#name : 'FASTPythonImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTPythonImporterDescription class >> baselineName [

	^ 'FASTPython'
]

{ #category : 'accessing' }
FASTPythonImporterDescription class >> branch [

	^ 'main'
]

{ #category : 'accessing' }
FASTPythonImporterDescription class >> extensions [

	^ #( 'py' )
]

{ #category : 'accessing' }
FASTPythonImporterDescription class >> projectName [

	^ 'FAST-Python'
]

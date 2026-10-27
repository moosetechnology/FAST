"
I describe the FAST Fortran importer, hosted in the FAST-Fortran repository and loaded with the FASTFortran baseline. It needs an external fortran-src-extras binary at runtime. I handle Fortran source files.
"
Class {
	#name : 'FASTFortranImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTFortranImporterDescription class >> baselineName [

	^ 'FASTFortran'
]

{ #category : 'accessing' }
FASTFortranImporterDescription class >> extensions [

	^ #( 'f' )
]

{ #category : 'accessing' }
FASTFortranImporterDescription class >> projectName [

	^ 'FAST-Fortran'
]

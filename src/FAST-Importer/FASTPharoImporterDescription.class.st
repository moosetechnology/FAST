"
I describe the FAST Pharo importer, hosted in the FASTPharo repository and loaded with the FASTPharo baseline. Its sources are at the root of the repository. I handle Pharo source files.
"
Class {
	#name : 'FASTPharoImporterDescription',
	#superclass : 'FASTImporterDescription',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTPharoImporterDescription class >> baselineName [

	^ 'FASTPharo'
]

{ #category : 'accessing' }
FASTPharoImporterDescription class >> extensions [

	^ #( 'st' )
]

{ #category : 'accessing' }
FASTPharoImporterDescription class >> group [

	^ 'importer'
]

{ #category : 'testing' }
FASTPharoImporterDescription class >> isWorking [
	"FAST-Pharo does not work since Moose 8. Kept in the list until it is fixed."

	^ false
]

{ #category : 'accessing' }
FASTPharoImporterDescription class >> projectName [

	^ 'FAST-Pharo'
]

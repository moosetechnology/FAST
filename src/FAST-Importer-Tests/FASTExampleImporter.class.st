"
I am a minimal importer used to test the importer API trait. My parse:into: answers the source and the model it received.
"
Class {
	#name : 'FASTExampleImporter',
	#superclass : 'Object',
	#traits : 'FASTTImporter',
	#classTraits : 'FASTTImporter classTrait',
	#category : 'FAST-Importer-Tests',
	#package : 'FAST-Importer-Tests'
}

{ #category : 'accessing' }
FASTExampleImporter class >> extensions [

	^ #( 'ex' )
]

{ #category : 'importing' }
FASTExampleImporter >> parse: aString into: aModel [

	^ {
		  aString.
		  aModel }
]

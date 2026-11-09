"
I define the API of a FAST importer. I am used on the class side of an importer, for example `FASTPythonImporter class` uses `FASTTImporter classTrait`.
An importer must implement #extensions, answering the file extensions it handles without the dot, and #parse:into:, answering the FAST model after importing the source in the model given as argument. A nil model means that the importer creates a new one.
Giving an existing model allows one to import many files in the same model.
"
Trait {
	#name : 'FASTTImporter',
	#category : 'FAST-Importer',
	#package : 'FAST-Importer'
}

{ #category : 'accessing' }
FASTTImporter classSide >> extensions [
	"File extensions without the dot that the importer handles"

	^ self explicitRequirement
]

{ #category : 'testing' }
FASTTImporter classSide >> handlesFile: aFileReference [
	"Answers whether the importer handles the file, according to its extension"

	^ self extensions anySatisfy: [ :extension | extension sameAs: aFileReference extension ]
]

{ #category : 'importing' }
FASTTImporter classSide >> parse: aString [
	"Import the source in a new FAST model and answer it"

	^ self parse: aString into: nil
]

{ #category : 'importing' }
FASTTImporter classSide >> parse: aString into: aModel [
	"Import the source in the FAST model, or in a new one if the model is nil, and answer the model"

	^ self explicitRequirement
]

{ #category : 'importing' }
FASTTImporter classSide >> parseFile: aFileReference [
	"Import the file in a new FAST model and answer it"

	^ self parseFile: aFileReference into: nil
]

{ #category : 'importing' }
FASTTImporter classSide >> parseFile: aFileReference into: aModel [
	"Import the file in the FAST model, or in a new one if the model is nil, and answer the model. Files are expected to be encoded in UTF-8"

	^ self parse: aFileReference asFileReference contents into: aModel
]

"
I define the API of a FAST importer. I must be used on the instance side and on the class side of an importer (`MyImporter uses: FASTTImporter` and `MyImporter class uses: FASTTImporter classTrait`).
An importer must implement #parse:into: on its instance side, answering the FAST model after importing the source in the model given as argument, and may override #extensions on its class side, answering the file extensions it handles without the dot (none by default). A nil model means that the importer creates a new one.
Giving an existing model allows one to import many files in the same model.
The class side only creates an importer and delegates to the instance side, except for #handlesFile: that checks the extension of the file.
"
Trait {
	#name : 'FASTTImporter',
	#category : 'FAST-Importer',
	#package : 'FAST-Importer'
}

{ #category : 'accessing' }
FASTTImporter classSide >> extensions [
	"File extensions without the dot that the importer handles. An importer that does not declare any handles no file."

	^ #(  )
]

{ #category : 'testing' }
FASTTImporter classSide >> handlesFile: aFileReference [
	"Answers whether the importer handles the file, according to its extension"

	^ self extensions anySatisfy: [ :extension | extension sameAs: aFileReference extension ]
]

{ #category : 'testing' }
FASTTImporter classSide >> isAbstract [
	"Answers whether the importer is abstract, so that FASTAgnosticImporter does not use it. Concrete importers keep the default."

	^ false
]

{ #category : 'importing' }
FASTTImporter classSide >> parse: aString [
	"Import the source in a new FAST model with a new importer and answer it"

	^ self new parse: aString
]

{ #category : 'importing' }
FASTTImporter classSide >> parse: aString into: aModel [
	"Import the source in the FAST model, or in a new one if the model is nil, with a new importer and answer the model"

	^ self new parse: aString into: aModel
]

{ #category : 'importing' }
FASTTImporter classSide >> parseFile: aFileReference [
	"Import the file in a new FAST model with a new importer and answer it"

	^ self new parseFile: aFileReference
]

{ #category : 'importing' }
FASTTImporter classSide >> parseFile: aFileReference into: aModel [
	"Import the file in the FAST model, or in a new one if the model is nil, with a new importer and answer the model"

	^ self new parseFile: aFileReference into: aModel
]

{ #category : 'accessing' }
FASTTImporter >> extensions [
	"File extensions without the dot that the importer handles"

	^ self class extensions
]

{ #category : 'testing' }
FASTTImporter >> handlesFile: aFileReference [
	"Answers whether the importer handles the file, according to its extension"

	^ self class handlesFile: aFileReference
]

{ #category : 'importing' }
FASTTImporter >> parse: aString [
	"Import the source in a new FAST model and answer it"

	^ self parse: aString into: nil
]

{ #category : 'importing' }
FASTTImporter >> parse: aString into: aModel [
	"Import the source in the FAST model, or in a new one if the model is nil, and answer the model"

	^ self explicitRequirement
]

{ #category : 'importing' }
FASTTImporter >> parseFile: aFileReference [
	"Import the file in a new FAST model and answer it"

	^ self parseFile: aFileReference into: nil
]

{ #category : 'importing' }
FASTTImporter >> parseFile: aFileReference into: aModel [
	"Import the file in the FAST model, or in a new one if the model is nil, and answer the model. Files are expected to be encoded in UTF-8"

	^ self parse: aFileReference asFileReference contents into: aModel
]

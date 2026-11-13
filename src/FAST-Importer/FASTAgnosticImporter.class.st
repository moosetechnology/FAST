"
I import a file without knowing which importer reads it. I find the importers of the image: the classes that use the FASTTImporter class trait, and their concrete subclasses. I choose the one whose extensions match the file.

Use my class side to import a file, which creates a new model:

```smalltalk
FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
```

Give a model to add the file to a model already built, for example to import several files in one model:

```smalltalk
| model |
model := FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
FASTAgnosticImporter parseFile: 'src/Other.java' asFileReference into: model.
```

Ask me which importer handles a file, without importing it:

```smalltalk
FASTAgnosticImporter importerFor: 'src/Main.java' asFileReference.
```

When no loaded importer handles the file, I load the project of a matching description first (see FASTImporterDescription). I signal FASTAmbiguousImporterError when several importers handle the file, and an error when none does.

The behaviour is on my instance side, so I can also be used as `FASTAgnosticImporter new parseFile: ...`.
"
Class {
	#name : 'FASTAgnosticImporter',
	#superclass : 'Object',
	#category : 'FAST-Importer',
	#package : 'FAST-Importer'
}

{ #category : 'importing' }
FASTAgnosticImporter class >> importerFor: aFileReference [
	"Answer the importer class that handles the file"

	^ self new importerFor: aFileReference
]

{ #category : 'importing' }
FASTAgnosticImporter class >> parseFile: aFileReference [
	"Import the file with the importer that handles its extension, in a new model"

	^ self new parseFile: aFileReference
]

{ #category : 'importing' }
FASTAgnosticImporter class >> parseFile: aFileReference into: aModel [
	"Import the file with the importer that handles its extension, in the model given or in a new one when it is nil"

	^ self new parseFile: aFileReference into: aModel
]

{ #category : 'accessing' }
FASTAgnosticImporter >> importerClasses [
	"The concrete importers: the classes that use the FASTTImporter class trait, and their concrete subclasses"

	| users |
	users := FASTTImporter classTrait users collect: [ :metaclass | metaclass soleInstance ].
	^ (users flatCollect: [ :class | class withAllSubclasses ]) reject: [ :class | class isAbstract ]
]

{ #category : 'importing' }
FASTAgnosticImporter >> importerFor: aFileReference [
	"Answer the importer class that handles the file. When no loaded importer handles it, the project of a matching description is loaded first. Fail when no importer handles it, and signal FASTAmbiguousImporterError when several do."

	| candidates |
	candidates := self importerClasses select: [ :class | class handlesFile: aFileReference ].
	candidates ifEmpty: [
			(self loadMissingImporterFor: aFileReference) ifTrue: [ ^ self importerFor: aFileReference ].
			^ self error: 'No importer handles the file ' , aFileReference basename ].
	candidates size > 1 ifTrue: [
			^ FASTAmbiguousImporterError new
				  candidates: candidates asArray;
				  signal: 'Several importers handle the file ' , aFileReference basename ].
	^ candidates anyOne
]

{ #category : 'importing' }
FASTAgnosticImporter >> loadMissingImporterFor: aFileReference [
	"Load the project of a working description that handles the extension of the file, when its importer is not loaded. Interactively, the user is asked first. Answer whether a project was loaded."

	| descriptions description |
	descriptions := FASTImporterDescription allSubclasses select: [ :each | each isWorking and: [ (each extensions includes: aFileReference extension) and: [ each isProjectLoaded not ] ] ].
	descriptions ifEmpty: [ ^ false ].
	description := descriptions first.
	(Smalltalk isInteractive and: [
			 (SpConfirmDialog new
				  title: 'Load a project';
				  message: 'Load ' , description baselineName , ' to import ' , aFileReference basename , '?';
				  openModal) not ]) ifTrue: [ ^ false ].
	description loadProject.
	^ true
]

{ #category : 'importing' }
FASTAgnosticImporter >> parseFile: aFileReference [
	"Import the file with the importer that handles its extension, in a new model"

	^ (self importerFor: aFileReference) parseFile: aFileReference
]

{ #category : 'importing' }
FASTAgnosticImporter >> parseFile: aFileReference into: aModel [
	"Import the file with the importer that handles its extension, in the model given or in a new one when it is nil"

	^ (self importerFor: aFileReference) parseFile: aFileReference into: aModel
]

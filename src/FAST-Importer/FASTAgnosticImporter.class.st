"
I import source files without knowing which importer reads them. I find the importers of the image: the classes that use the FASTTImporter class trait, and their concrete subclasses. I choose the one whose extensions match the file.

The most common calls are on my class side.

Import one file, in a new model:

```smalltalk
FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
```

Add a file to a model you already have:

```smalltalk
| model |
model := FASTAgnosticImporter parseFile: 'src/Main.java' asFileReference.
FASTAgnosticImporter parseFile: 'src/Other.java' asFileReference into: model.
```

Ask which importer handles a file, without importing it:

```smalltalk
FASTAgnosticImporter importerFor: 'src/Main.java' asFileReference.
```

Import a folder (its subfolders included), or a list of files. The files are grouped by importer, and each importer fills one model. The answer is a dictionary from each model to the files that filled it; the files that no importer handles are answered under nil:

```smalltalk
| result |
result := FASTAgnosticImporter parseFolder: 'src' asFileReference.
result := FASTAgnosticImporter parseFiles: { 'A.java' asFileReference. 'style.css' asFileReference }.
```

The options are on my instance side. Create me, give me a strategy, then use the same messages:

```smalltalk
FASTAgnosticImporter new
	missingImporterStrategy: FASTAlwaysLoadStrategy new;
	parseFolder: 'src' asFileReference.
```

The strategy decides whether the project of a matching description may be loaded when no loaded importer handles a file. The strategies are:
- FASTAskOrLoadStrategy (the default): in an interactive image the user is asked before a project is loaded, otherwise it is loaded.
- FASTAlwaysLoadStrategy: the project is loaded without asking. Use it to bypass the loading dialog.
- FASTNeverLoadStrategy: no project is loaded, and the files it would import are answered under nil.

A new strategy is a subclass of FASTMissingImporterStrategy that implements allowsLoadingOf:for:.

When several importers handle the extension of a file, FASTAmbiguousImporterError is signaled. When no importer handles a file in a single-file import, an error is signaled.
"
Class {
	#name : 'FASTAgnosticImporter',
	#superclass : 'Object',
	#instVars : [
		'missingImporterStrategy'
	],
	#category : 'FAST-Importer-Agnostic',
	#package : 'FAST-Importer',
	#tag : 'Agnostic'
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

{ #category : 'importing' }
FASTAgnosticImporter class >> parseFiles: aCollection [
	"Import the files with the default options, as parseFiles: of an instance does"

	^ self new parseFiles: aCollection
]

{ #category : 'importing' }
FASTAgnosticImporter class >> parseFolder: aFolder [
	"Import the files of the folder with the default options, as parseFolder: of an instance does"

	^ self new parseFolder: aFolder
]

{ #category : 'importing' }
FASTAgnosticImporter >> importerClassFor: aFileReference [
	"Answer the importer class that handles the file, loading the project of a matching description when my policy allows it. Answer nil when no importer handles the file. Signal FASTAmbiguousImporterError when several do."

	| candidates |
	candidates := self importerClasses select: [ :class | class handlesFile: aFileReference ].
	candidates isEmpty ifTrue: [
			(self loadMissingImporterFor: aFileReference) ifFalse: [ ^ nil ].
			candidates := self importerClasses select: [ :class | class handlesFile: aFileReference ] ].
	candidates isEmpty ifTrue: [ ^ nil ].
	candidates size > 1 ifTrue: [
			^ FASTAmbiguousImporterError new
				  candidates: candidates asArray;
				  signal: 'Several importers handle the file ' , aFileReference basename ].
	^ candidates anyOne
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
	"Answer the importer class that handles the file. Fail when no importer handles it, and signal FASTAmbiguousImporterError when several do."

	^ (self importerClassFor: aFileReference) ifNil: [ self error: 'No importer handles the file ' , aFileReference basename ]
]

{ #category : 'importing' }
FASTAgnosticImporter >> loadMissingImporterFor: aFileReference [
	"Load the project of a working description that handles the extension of the file, when its importer is not loaded and my strategy allows it. Answer whether a project was loaded."

	| descriptions description |
	descriptions := FASTImporterDescription allSubclasses select: [ :each | each isWorking and: [ (each extensions includes: aFileReference extension) and: [ each isProjectLoaded not ] ] ].
	descriptions ifEmpty: [ ^ false ].
	description := descriptions first.
	(self missingImporterStrategy allowsLoadingOf: description for: aFileReference) ifFalse: [ ^ false ].
	description loadProject.
	^ true
]

{ #category : 'accessing' }
FASTAgnosticImporter >> missingImporterStrategy [
	"The strategy deciding whether a missing project may be loaded"

	^ missingImporterStrategy ifNil: [ FASTAskOrLoadStrategy new ]
]

{ #category : 'accessing' }
FASTAgnosticImporter >> missingImporterStrategy: aStrategy [
	"Set the strategy deciding whether a missing project may be loaded"

	missingImporterStrategy := aStrategy
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

{ #category : 'importing' }
FASTAgnosticImporter >> parseFiles: aCollection [
	"Import the files, with one model per importer, and answer a dictionary from each model to the files that filled it. The files that no importer handles are answered under nil."

	| filesByImporter result |
	filesByImporter := Dictionary new.
	result := Dictionary new.
	aCollection do: [ :file |
			| importer |
			importer := self importerClassFor: file.
			importer
				ifNil: [ (result at: nil ifAbsentPut: [ OrderedCollection new ]) add: file ]
				ifNotNil: [ (filesByImporter at: importer ifAbsentPut: [ OrderedCollection new ]) add: file ] ].
	filesByImporter keysAndValuesDo: [ :importer :files |
			| model |
			model := nil.
			files do: [ :file | model := importer parseFile: file into: model ].
			result at: model put: files ].
	^ result
]

{ #category : 'importing' }
FASTAgnosticImporter >> parseFolder: aFolder [
	"Import all the files of the folder and its subfolders, as parseFiles: does"

	^ self parseFiles: aFolder allFiles asArray
]

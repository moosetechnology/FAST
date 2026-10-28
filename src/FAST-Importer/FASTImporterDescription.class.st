"
I describe a FAST importer without requiring it to be loaded. I am abstract: my subclasses are used on the class side only and declare where the importer comes from (GitHub organisation, project, branch, path, Metacello baseline and group), which languages it handles through file extensions, and the class name of the importer once it is loaded. The importer registry uses me to find the importer for a file and the project importer uses my load expression to load a missing importer with Metacello.
"
Class {
	#name : 'FASTImporterDescription',
	#superclass : 'Object',
	#category : 'FAST-Importer-Description',
	#package : 'FAST-Importer',
	#tag : 'Description'
}

{ #category : 'accessing' }
FASTImporterDescription class >> baselineName [
	"Name of the Metacello baseline that loads the importer"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTImporterDescription class >> branch [
	"Git branch or tag of the importer repository, nil loads the default branch"

	^ 'master'
]

{ #category : 'accessing' }
FASTImporterDescription class >> extensions [
	"File extensions without the dot that the importer handles"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTImporterDescription class >> githubOrganisation [
	"GitHub organisation hosting the importer repository"

	^ 'moosetechnology'
]

{ #category : 'accessing' }
FASTImporterDescription class >> group [
	"Metacello group of the baseline to load, for example 'core' or 'default'"

	^ 'default'
]

{ #category : 'testing' }
FASTImporterDescription class >> isAbstract [
	"I am abstract, only my subclasses describe an importer"

	^ self == FASTImporterDescription
]

{ #category : 'testing' }
FASTImporterDescription class >> isProjectLoaded [
	"Answers whether the project class is present in the image"

	self flag: #todo. "Check if this is enough. We should probably check the importer instead since we could load a group without the importer or load the baseline only."
	^ self class environment includesKey: self baselineName asSymbol
]

{ #category : 'actions' }
FASTImporterDescription class >> loadAll [
	"This is mostly for development if we wish to have an image with all FAST projects loaded."

	<script>
	self withAllSuperclassesDo: #loadProject
]

{ #category : 'actions' }
FASTImporterDescription class >> loadProject [

	Metacello new
		baseline: self baselineName;
		repository: self repositoryUrl;
		onWarningLog;
		onConflictUseLoaded;
		load: self group
]

{ #category : 'accessing' }
FASTImporterDescription class >> path [
	"Directory of the baseline inside the repository"

	^ 'src'
]

{ #category : 'accessing' }
FASTImporterDescription class >> projectName [
	"Name of the importer repository on GitHub"

	^ self subclassResponsibility
]

{ #category : 'building' }
FASTImporterDescription class >> repositoryUrl [
	"Metacello GitHub repository URL of the importer, for example github://moosetechnology/FAST-Python:main/src"

	^ String streamContents: [ :stream |
			  stream
				  nextPutAll: 'github://';
				  nextPutAll: self githubOrganisation;
				  nextPut: $/;
				  nextPutAll: self projectName.
			  self branch ifNotNil: [ :branchName |
					  stream
						  nextPut: $:;
						  nextPutAll: branchName ].
			  self path ifNotEmpty: [ :directory |
					  stream
						  nextPut: $/;
						  nextPutAll: directory ] ]
]

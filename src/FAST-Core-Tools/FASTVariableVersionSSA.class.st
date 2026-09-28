"
I am a plain SSA version of a variable, created each time the variable is assigned. I hold the version number (`version`) of the variable and the local declaration (`localDeclaration`) I belong to.

My name is built from the name of my local declaration and my version number, for example `x_1`.

I require the SSA resolution to have been run on the model before being used.
"
Class {
	#name : 'FASTVariableVersionSSA',
	#superclass : 'FASTAbstractVariableVersionSSA',
	#instVars : [
		'version'
	],
	#category : 'FAST-Core-Tools-SSA',
	#package : 'FAST-Core-Tools',
	#tag : 'SSA'
}

{ #category : 'meta' }
FASTVariableVersionSSA class >> annotation [

	<FMClass: #VariableVersionSSA super: #FASTAbstractVariableVersionSSA>
	<package: #'FAST-Core-Tools'>
	
]

{ #category : 'adding' }
FASTVariableVersionSSA >> addChoiceToPhi: aPhiVersion [

	aPhiVersion choices add: self
]

{ #category : 'instance creation' }
FASTVariableVersionSSA >> for: aFASTNode [

	localDeclaration := aFASTNode localDeclaration.
]

{ #category : 'initialization' }
FASTVariableVersionSSA >> initialize [

	super initialize.

	version := 0
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> name [

	^ String streamContents: [ :s |
			  s
				  nextPutAll: self localDeclarationName;
				  nextPut: $_;
				  nextPutAll: version asString ]
]

{ #category : 'instance creation' }
FASTVariableVersionSSA >> newVersionNumber [

	^ version := version + 1
]

{ #category : 'testing' }
FASTVariableVersionSSA >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> ssaVariables [

	^ { self }
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> version [

	<FMProperty: #version type: #Number>
	<FMComment: 'The version number of this specific variable version'>
	^ version
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> version: anObject [

	version := anObject
]

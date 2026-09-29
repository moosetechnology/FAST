"
I am the abstract representation of a version of a variable in Static Single Assignment form (SSA). A version represents a value assigned exactly once to a variable: each assignment to a variable during the SSA resolution creates a new version.

I store the local declaration (`localDeclaration`) of the variable this version belongs to, and I provide the common behavior shared by the concrete versions:

- `localUses` returns the accesses (reads and writes) linked to this version.
- `readAccesses` and `writeAccesses` split those accesses.
- `ssaVariables` returns the plain variable versions I represent: only myself for a `FASTVariableVersionSSA`, all my choices for a `FASTVariablePhiVersionSSA`.
- `name` returns a readable SSA name.

I have two concrete subclasses:
- `FASTVariableVersionSSA` is a plain version with a version number.
- `FASTVariablePhiVersionSSA` merges several versions at a control-flow join point.

I require the SSA resolution to have been run on the model before being used.
"
Class {
	#name : 'FASTAbstractVariableVersionSSA',
	#superclass : 'MooseEntity',
	#instVars : [
		'localDeclaration'
	],
	#category : 'FAST-Core-Tools-SSA',
	#package : 'FAST-Core-Tools',
	#tag : 'SSA'
}

{ #category : 'meta' }
FASTAbstractVariableVersionSSA class >> annotation [

	<FMClass: #AbstractVariableVersionSSA super: #MooseEntity>
	<package: #'FAST-Core-Tools'>
	<abstract>
	
]

{ #category : 'instance creation' }
FASTAbstractVariableVersionSSA class >> for: aFASTFortranVariable [

	^self new
		for: aFASTFortranVariable ;
		yourself
]

{ #category : 'adding' }
FASTAbstractVariableVersionSSA >> addChoiceToPhi: aPhiVersion [

	self subclassResponsibility
]

{ #category : 'instance creation' }
FASTAbstractVariableVersionSSA >> for: aCollection [ 
	^ self subclassResponsibility
]

{ #category : 'testing' }
FASTAbstractVariableVersionSSA >> includes: aSSAVersion [

	^ self ssaVariables includes: aSSAVersion
]

{ #category : 'testing' }
FASTAbstractVariableVersionSSA >> includesVersionOrPhi: aSSAVersionOrPhi [

	^ aSSAVersionOrPhi ssaVariables anySatisfy: [ :variable | self includes: variable ]
]

{ #category : 'testing' }
FASTAbstractVariableVersionSSA >> isPhi [

	^ false
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> localDeclaration [

	<FMProperty: #localDeclaration type: #FASTTEntity>
	<FMComment: 'Return the local declaration of the variable I represent.'>
	^ localDeclaration
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> localDeclaration: anObject [

	localDeclaration := anObject
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> localDeclarationName [

	^ localDeclaration localDeclarationName
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> localUses [

	^ self localDeclaration localUses select: [ :access | access ssaVersion isNotNil and: [ access ssaVersion includesVersionOrPhi: self ] ]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> name [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> nodes [
	"Used for LocalResolver"

	<FMProperty: #nodes type: #FASTTCanBeLocalDeclaration opposite: #ssaVersion>
	<multivalued>
	<FMComment: 'Return all entities concerned with this SSA version.'>
	^ self attributeAt: #nodes ifAbsentPut: [ FMMultivalueLink on: self opposite: #ssaVersion: ]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> nodes: aCollectionOfFASTNodes [

	self nodes value: aCollectionOfFASTNodes
]

{ #category : 'printing' }
FASTAbstractVariableVersionSSA >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream nextPutAll: ' ['.

	self ssaVariables do: [ :variable | aStream print: variable name ] separatedBy: [ aStream nextPutAll: ', ' ].

	aStream nextPut: $]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> readAccesses [

	^ self localUses reject: [ :access | access isVariableWriteAccess ]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> ssaVariables [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> writeAccesses [

	^ self localUses select: [ :access | access isVariableWriteAccess ]
]

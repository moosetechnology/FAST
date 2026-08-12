Class {
	#name : 'FASTAbstractVariableVersionSSA',
	#superclass : 'Object',
	#instVars : [
		'localDeclaration'
	],
	#category : 'FAST-Core-Tools-SSA',
	#package : 'FAST-Core-Tools',
	#tag : 'SSA'
}

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

	^localDeclaration
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

	^ self localDeclaration localUses select: [ :access | access ssaVersion includesVersionOrPhi: self ]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> name [
	^ self subclassResponsibility
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

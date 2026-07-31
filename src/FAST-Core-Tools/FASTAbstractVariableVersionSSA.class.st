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

	^ self subclassResponsibility
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

	^ self localDeclaration localUses select: [ :access | access ssaVersion includes: self ]
]

{ #category : 'accessing' }
FASTAbstractVariableVersionSSA >> name [
	^ self subclassResponsibility
]

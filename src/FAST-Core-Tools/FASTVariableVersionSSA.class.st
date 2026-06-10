Class {
	#name : 'FASTVariableVersionSSA',
	#superclass : 'Object',
	#instVars : [
		'version',
		'localDeclaration'
	],
	#category : 'FAST-Core-Tools-SSA',
	#package : 'FAST-Core-Tools',
	#tag : 'SSA'
}

{ #category : 'instance creation' }
FASTVariableVersionSSA class >> for: aFASTFortranVariable [

	^self new
		for: aFASTFortranVariable ;
		yourself
]

{ #category : 'adding' }
FASTVariableVersionSSA >> addChoiceToPhi: aPhiVersion [

	aPhiVersion choices add: self
]

{ #category : 'instance creation' }
FASTVariableVersionSSA >> for: aFASTFortranVariable [

	localDeclaration := aFASTFortranVariable localDeclaration.
]

{ #category : 'initialization' }
FASTVariableVersionSSA >> initialize [

	super initialize.

	version := 0
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> localDeclaration [

	^localDeclaration
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> localDeclaration: anObject [

	localDeclaration := anObject
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> name [

	^ String streamContents: [ :s |
			s
				nextPutAll: localDeclaration localDeclarationName;
				nextPut: $_;
				nextPutAll: version asString ]
]

{ #category : 'instance creation' }
FASTVariableVersionSSA >> newVersionNumber [

	^version := version + 1
]

{ #category : 'testing' }
FASTVariableVersionSSA >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> version [

	^ version
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> version: anObject [

	version := anObject
]

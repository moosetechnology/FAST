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

	^ version
]

{ #category : 'accessing' }
FASTVariableVersionSSA >> version: anObject [

	version := anObject
]

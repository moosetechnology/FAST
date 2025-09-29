Class {
	#name : 'FASTSsaVariableVersion',
	#superclass : 'Object',
	#instVars : [
		'version',
		'localDeclaration'
	],
	#category : 'FAST-Core-Tools',
	#package : 'FAST-Core-Tools'
}

{ #category : 'instance creation' }
FASTSsaVariableVersion class >> for: aFASTFortranVariable [

	^self new
		for: aFASTFortranVariable ;
		yourself
]

{ #category : 'adding' }
FASTSsaVariableVersion >> addChoiceToPhi: aPhiVersion [

	aPhiVersion choices add: self
]

{ #category : 'instance creation' }
FASTSsaVariableVersion >> for: aFASTFortranVariable [

	localDeclaration := aFASTFortranVariable localDeclaration.
]

{ #category : 'initialization' }
FASTSsaVariableVersion >> initialize [

	super initialize.

	version := 0
]

{ #category : 'accessing' }
FASTSsaVariableVersion >> localDeclaration [

	^localDeclaration
]

{ #category : 'accessing' }
FASTSsaVariableVersion >> localDeclaration: anObject [

	localDeclaration := anObject
]

{ #category : 'accessing' }
FASTSsaVariableVersion >> name [

	^localDeclaration variable name , '_' , version asString
]

{ #category : 'instance creation' }
FASTSsaVariableVersion >> newVersionNumber [

	^version := version + 1
]

{ #category : 'testing' }
FASTSsaVariableVersion >> sameVariableAs: otherFASTFortranVariable [

	^self localDeclaration = otherFASTFortranVariable localDeclaration 
]

{ #category : 'accessing' }
FASTSsaVariableVersion >> version [

	^ version
]

{ #category : 'accessing' }
FASTSsaVariableVersion >> version: anObject [

	version := anObject
]

"
A ""null-object"" signaling the declaration of a 'name' was not found
"
Class {
	#name : #FASTNonLocalDeclaration,
	#superclass : #FASTEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'name'
	],
	#category : #'FAST-Core-Tools-Resolver'
}

{ #category : #testing }
FASTNonLocalDeclaration >> isNonLocalDeclaration [

	^true
]

{ #category : #accessing }
FASTNonLocalDeclaration >> name [

	^ name
]

{ #category : #accessing }
FASTNonLocalDeclaration >> name: anObject [

	name := anObject
]

"
A ""null-object"" signaling the declaration of a 'name' was not found
"
Class {
	#name : #FASTNonLocalDeclaration,
	#superclass : #FASTJavaEntity,
	#instVars : [
		'name'
	],
	#category : #'FAST-Core-Tools-Resolver'
}

{ #category : #accessing }
FASTNonLocalDeclaration >> name [

	^ name
]

{ #category : #accessing }
FASTNonLocalDeclaration >> name: anObject [

	name := anObject
]

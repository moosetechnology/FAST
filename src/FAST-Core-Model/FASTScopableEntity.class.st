"
A Entity with an optional scope

Statements are scopable because many statements allow to introduce local variables (e.g. for statement in Java)
"
Class {
	#name : #FASTScopableEntity,
	#superclass : #FASTEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTScopableEntity class >> annotation [

	<MSEClass: #ScopableEntity super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTScopableEntity class >> generatedSlotNames [
	<generated>
	'FASTScopableEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTScopableEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTScopableEntity class >> requirements [

	<generated>
	^ {  }
]

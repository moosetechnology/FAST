"
A Entity with an optional scope

Statements are scopable because many statements allow to introduce local variables (e.g. for statement in Java)
"
Class {
	#name : #FASTScopableEntity,
	#superclass : #FASTEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTScopableEntity class >> annotation [

	<FMClass: #ScopableEntity super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

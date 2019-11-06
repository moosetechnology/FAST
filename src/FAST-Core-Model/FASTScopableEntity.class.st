"
A Entity with an optional scope

Statements are scopable because many statements allow to introduce local variables (e.g. for statement in Java)
"
Class {
	#name : #FASTScopableEntity,
	#superclass : #FASTEntitySourceAnchor,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTScopableEntity class >> annotation [

	<FMClass: #ScopableEntity super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

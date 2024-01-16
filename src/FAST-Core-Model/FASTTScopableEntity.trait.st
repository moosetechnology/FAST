"
A Entity with an optional scope

Some statements are scopable because they allow to introduce local variables (e.g. for statement in Java)

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTScopableEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTScopableEntity classSide >> annotation [

	<FMClass: #TScopableEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

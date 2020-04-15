"
any named entity
"
Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

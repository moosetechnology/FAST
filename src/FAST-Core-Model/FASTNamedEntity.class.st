"
any named entity
"
Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTEntitySourceAnchor,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

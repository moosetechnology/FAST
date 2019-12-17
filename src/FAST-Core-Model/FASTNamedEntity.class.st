"
any named entity
"
Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTEntitySourceAnchor,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

Class {
	#name : #FASTSourcedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

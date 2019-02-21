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

{ #category : #generator }
FASTSourcedEntity class >> generatedSlotNames [
	<generated>
	'FASTSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FASTSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

Class {
	#name : #FASTSourceLanguage,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTSourceLanguage class >> generatedSlotNames [
	<generated>
	'FASTSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FASTSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

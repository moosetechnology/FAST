Class {
	#name : #FASTComment,
	#superclass : #FASTSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTComment class >> annotation [

	<MSEClass: #Comment super: #FASTSourcedEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTComment class >> generatedSlotNames [
	<generated>
	'FASTComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTComment class >> generatedTraitNames [
	<generated>
	^ #(FamixTComment)
]

{ #category : #meta }
FASTComment class >> requirements [

	<generated>
	^ {  }
]

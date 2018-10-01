Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FASTEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTNamedEntity class >> generatedSlotNames [
	<generated>
	'FASTNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTNamedEntity class >> requirements [

	<generated>
	^ {  }
]

"
A representation of a variable entity, 
"
Class {
	#name : #FASTVariableEntity,
	#superclass : #FASTEntitySourceAnchor,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTVariableEntity class >> annotation [

	<MSEClass: #VariableEntity super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTVariableEntity class >> generatedSlotNames [
	<generated>
	'FASTVariableEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTVariableEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTVariableEntity class >> requirements [

	<generated>
	^ {  }
]

"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method
"
Class {
	#name : #FASTNamedBehaviouralEntity,
	#superclass : #FASTBehaviouralEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedBehaviouralEntity class >> annotation [

	<MSEClass: #NamedBehaviouralEntity super: #FASTBehaviouralEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTNamedBehaviouralEntity class >> generatedSlotNames [
	<generated>
	'FASTNamedBehaviouralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTNamedBehaviouralEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTNamedBehaviouralEntity class >> requirements [

	<generated>
	^ {  }
]

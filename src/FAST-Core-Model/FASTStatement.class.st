"
An abstract subclass which represents a source code statemnet 
"
Class {
	#name : #FASTStatement,
	#superclass : #FASTScopableEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTStatement class >> annotation [

	<MSEClass: #Statement super: #FASTScopableEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTStatement class >> generatedSlotNames [
	<generated>
	'FASTStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTStatement class >> requirements [

	<generated>
	^ {  }
]

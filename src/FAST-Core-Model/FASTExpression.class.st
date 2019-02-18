"
An abstract superclass representing an expression node of a source code.
"
Class {
	#name : #FASTExpression,
	#superclass : #FASTEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTExpression class >> annotation [

	<MSEClass: #Expression super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTExpression class >> generatedSlotNames [
	<generated>
	'FASTExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTExpression class >> requirements [

	<generated>
	^ {  }
]

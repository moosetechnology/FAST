"
An abstract superclass representing an expression node of a source code.
"
Class {
	#name : #FASTExpression,
	#superclass : #FASTEntitySourceAnchor,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTExpression class >> annotation [

	<MSEClass: #Expression super: #FASTEntitySourceAnchor>
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

"
A string literal
"
Class {
	#name : #FASTStringLiteral,
	#superclass : #FASTLiteral,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTStringLiteral class >> annotation [

	<MSEClass: #StringLiteral super: #FASTLiteral>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTStringLiteral class >> generatedSlotNames [
	<generated>
	'FASTStringLiteral class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTStringLiteral class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTStringLiteral class >> requirements [

	<generated>
	^ {  }
]

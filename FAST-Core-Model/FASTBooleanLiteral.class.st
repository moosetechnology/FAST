"
A boolean literal
"
Class {
	#name : #FASTBooleanLiteral,
	#superclass : #FASTLiteral,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTBooleanLiteral class >> annotation [

	<MSEClass: #BooleanLiteral super: #FASTLiteral>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTBooleanLiteral class >> generatedSlotNames [
	<generated>
	'FASTBooleanLiteral class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTBooleanLiteral class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTBooleanLiteral class >> requirements [

	<generated>
	^ {  }
]

"
A node of a statement which is representing a single expression. 
"
Class {
	#name : #FASTExpressionStatement,
	#superclass : #FASTStatement,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTExpressionStatement class >> annotation [

	<MSEClass: #ExpressionStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTExpressionStatement class >> generatedSlotNames [
	<generated>
	'FASTExpressionStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTExpressionStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTExpressionStatement class >> requirements [

	<generated>
	^ {  }
]

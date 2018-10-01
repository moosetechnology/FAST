"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Class {
	#name : #FASTLiteral,
	#superclass : #FASTExpression,
	#instVars : [
		'value'
	],
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTLiteral class >> annotation [

	<MSEClass: #Literal super: #FASTExpression>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTLiteral class >> generatedSlotNames [
	<generated>
	'FASTLiteral class>>#generatedSlotNames'.
	^ #(value)
]

{ #category : #generator }
FASTLiteral class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTLiteral class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTLiteral >> value: anObject [

	<generated>
	value := anObject

]

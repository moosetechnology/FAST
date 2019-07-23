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
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTLiteral class >> annotation [

	<MSEClass: #Literal super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTLiteral >> value [

	<MSEProperty: #value type: #String>
	<generated>
	<MSEComment: 'The literal itself as found in the source code'>
	^ value
]

{ #category : #accessing }
FASTLiteral >> value: anObject [

	<generated>
	value := anObject

]

"
todo
"
Class {
	#name : #FASTJavaCastExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'type',
		'expression'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaCastExpression class >> annotation [

	<MSEClass: #JavaCastExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaCastExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaCastExpression class>>#generatedSlotNames'.
	^ #(expression type)
]

{ #category : #generator }
FASTJavaCastExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaCastExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaCastExpression >> expression [

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'The expression to cast'>
	^ expression
]

{ #category : #accessing }
FASTJavaCastExpression >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #accessing }
FASTJavaCastExpression >> type [

	<MSEProperty: #type type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'The type in witch the expression will be cast'>
	^ type
]

{ #category : #accessing }
FASTJavaCastExpression >> type: anObject [

	<generated>
	type := anObject

]

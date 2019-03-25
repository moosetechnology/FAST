"
A node of a statement which is representing a single expression. 
"
Class {
	#name : #FASTExpressionStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#expression => FMOne type: #FASTExpression opposite: #expressionStatementOwner'
	],
	#category : #'FAST-Core-Model-Entities'
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
	^ #(expression)
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

{ #category : #accessing }
FASTExpressionStatement >> expression [

	<generated>
	<MSEComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #navigation }
FASTExpressionStatement >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

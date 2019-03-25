"
A return statement node. Contains a reference to the expression which is returned.  
"
Class {
	#name : #FASTReturnStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#expression => FMOne type: #FASTExpression opposite: #returnOwner'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTReturnStatement class >> annotation [

	<MSEClass: #ReturnStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTReturnStatement class >> generatedSlotNames [
	<generated>
	'FASTReturnStatement class>>#generatedSlotNames'.
	^ #(expression)
]

{ #category : #generator }
FASTReturnStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTReturnStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTReturnStatement >> expression [

	<generated>
	<MSEComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTReturnStatement >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #navigation }
FASTReturnStatement >> expressionGroup [

	<generated>
	<navigation: 'Expression'>
	^ MooseGroup
			with: (self expression)
]

"
I represent a java array access
	
ex:

liste[i]
"
Class {
	#name : #FASTJavaArrayAccess,
	#superclass : #FASTExpression,
	#instVars : [
		'array',
		'expression'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAccess class >> annotation [

	<MSEClass: #JavaArrayAccess super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaArrayAccess class >> generatedSlotNames [
	<generated>
	'FASTJavaArrayAccess class>>#generatedSlotNames'.
	^ #(array expression)
]

{ #category : #generator }
FASTJavaArrayAccess class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaArrayAccess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaArrayAccess >> array [

	<MSEProperty: #array type: #Object>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ array
]

{ #category : #accessing }
FASTJavaArrayAccess >> array: anObject [

	<generated>
	array := anObject

]

{ #category : #accessing }
FASTJavaArrayAccess >> expression [

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'The accessed index'>
	^ expression
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression: anObject [

	<generated>
	expression := anObject

]

"
I represent a java array access
	
ex:

liste[i]
"
Class {
	#name : #FASTJavaArrayAccess,
	#superclass : #FASTExpression,
	#instVars : [
		'expression',
		'fieldName'
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
	^ #(expression fieldName)
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

{ #category : #accessing }
FASTJavaArrayAccess >> fieldName [

	<MSEProperty: #fieldName type: #String>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaArrayAccess >> fieldName: anObject [

	<generated>
	fieldName := anObject

]

"
I represent the invocation of a Class constructor with the keyword 'new'

ex.

new Patate()
"
Class {
	#name : #FASTJavaNewExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'type'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaNewExpression class >> annotation [

	<MSEClass: #JavaNewExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaNewExpression class>>#generatedSlotNames'.
	^ #(type)
]

{ #category : #generator }
FASTJavaNewExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaNewExpression >> type [

	<MSEProperty: #type type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'The type of the array'>
	^ type
]

{ #category : #accessing }
FASTJavaNewExpression >> type: anObject [

	<generated>
	type := anObject

]

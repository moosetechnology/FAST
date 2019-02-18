"
A FASTJavaFieldAccess corresponds to an access to an instance variable (field)
"
Class {
	#name : #FASTJavaFieldAccess,
	#superclass : #FASTExpression,
	#instVars : [
		'fieldName'
	],
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaFieldAccess class >> annotation [

	<MSEClass: #JavaFieldAccess super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaFieldAccess class >> generatedSlotNames [
	<generated>
	'FASTJavaFieldAccess class>>#generatedSlotNames'.
	^ #(fieldName)
]

{ #category : #generator }
FASTJavaFieldAccess class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaFieldAccess class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName [

	<MSEProperty: #fieldName type: #String>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaFieldAccess >> fieldName: anObject [

	<generated>
	fieldName := anObject

]

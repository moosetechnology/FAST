"
I represent the invocation of a Class constructor with the keyword 'new'

ex.

new Patate()
"
Class {
	#name : #FASTJavaNewExpression,
	#superclass : #FASTJavaMethodInvocation,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaNewExpression class >> annotation [

	<MSEClass: #JavaNewExpression super: #FASTJavaMethodInvocation>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaNewExpression class>>#generatedSlotNames'.
	^ #()
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

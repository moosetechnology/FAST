"
I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart
"
Class {
	#name : #FASTJavaConditionalStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaConditionalStatement class >> annotation [

	<MSEClass: #JavaConditionalStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaConditionalStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaConditionalStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaConditionalStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaConditionalStatement class >> requirements [

	<generated>
	^ {  }
]

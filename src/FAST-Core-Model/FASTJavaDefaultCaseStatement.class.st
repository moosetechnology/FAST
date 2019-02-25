"
I represent a default case
	
ex.:

default:
"
Class {
	#name : #FASTJavaDefaultCaseStatement,
	#superclass : #FASTJavaCaseStatement,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaDefaultCaseStatement class >> annotation [

	<MSEClass: #JavaDefaultCaseStatement super: #FASTJavaCaseStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaDefaultCaseStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaDefaultCaseStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaDefaultCaseStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaDefaultCaseStatement class >> requirements [

	<generated>
	^ {  }
]

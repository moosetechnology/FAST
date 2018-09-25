"
A return statement node. Contains a reference to the expression which is returned.  
"
Class {
	#name : #FASTReturnStatement,
	#superclass : #FASTStatement,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTReturnStatement class >> annotation [

	<MSEClass: #ReturnStatement super: #FASTStatement>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTReturnStatement class >> generatedSlotNames [
	<generated>
	'FASTReturnStatement class>>#generatedSlotNames'.
	^ #()
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

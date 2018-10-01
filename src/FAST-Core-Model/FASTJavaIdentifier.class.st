"
A FASTJavaIdentifier is an identifier in a Java program
"
Class {
	#name : #FASTJavaIdentifier,
	#superclass : #FASTVariableExpression,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaIdentifier class >> annotation [

	<MSEClass: #JavaIdentifier super: #FASTVariableExpression>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaIdentifier class >> generatedSlotNames [
	<generated>
	'FASTJavaIdentifier class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaIdentifier class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaIdentifier class >> requirements [

	<generated>
	^ {  }
]

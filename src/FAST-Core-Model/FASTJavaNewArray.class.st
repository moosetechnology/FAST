"
I represent a java new array node.
ex.

new String()[""10px"", ""Hello world""]
"
Class {
	#name : #FASTJavaNewArray,
	#superclass : #FASTJavaNewExpression,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaNewArray class >> annotation [

	<MSEClass: #JavaNewArray super: #FASTJavaNewExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewArray class >> generatedSlotNames [
	<generated>
	'FASTJavaNewArray class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNewArray class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewArray class >> requirements [

	<generated>
	^ {  }
]

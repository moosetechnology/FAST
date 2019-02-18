"
A node representing switch stetement

eg.
switch (_) {
...
}
"
Class {
	#name : #FASTJavaSwitchStatement,
	#superclass : #FASTStatement,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaSwitchStatement class >> annotation [

	<MSEClass: #JavaSwitchStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaSwitchStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaSwitchStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaSwitchStatement class >> requirements [

	<generated>
	^ {  }
]

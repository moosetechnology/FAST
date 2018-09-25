"
A node of a for loop statement.

eg.
for(_;_;_) {
...
}
"
Class {
	#name : #FASTJavaForStatement,
	#superclass : #FASTStatement,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaForStatement class >> annotation [

	<MSEClass: #JavaForStatement super: #FASTStatement>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaForStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaForStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaForStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaForStatement class >> requirements [

	<generated>
	^ {  }
]

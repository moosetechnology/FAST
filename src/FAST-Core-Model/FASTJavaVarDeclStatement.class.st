"
A statement of variable declaration

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.
"
Class {
	#name : #FASTJavaVarDeclStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'type'
	],
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaVarDeclStatement class >> annotation [

	<MSEClass: #JavaVarDeclStatement super: #FASTStatement>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaVarDeclStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaVarDeclStatement class>>#generatedSlotNames'.
	^ #(type)
]

{ #category : #generator }
FASTJavaVarDeclStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaVarDeclStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type [

	<MSEProperty: #type type: #FAMIXType>
	<generated>
	<MSEComment: 'type of declared variables'>
	^ type
]

{ #category : #accessing }
FASTJavaVarDeclStatement >> type: anObject [

	<generated>
	type := anObject

]

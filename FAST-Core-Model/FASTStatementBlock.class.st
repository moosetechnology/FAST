"
A block of statements as ones in C-like langs with {}
"
Class {
	#name : #FASTStatementBlock,
	#superclass : #FASTStatement,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTStatementBlock class >> annotation [

	<MSEClass: #StatementBlock super: #FASTStatement>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTStatementBlock class >> generatedSlotNames [
	<generated>
	'FASTStatementBlock class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTStatementBlock class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTStatementBlock class >> requirements [

	<generated>
	^ {  }
]

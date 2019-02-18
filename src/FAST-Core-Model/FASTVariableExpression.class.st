"
A node that wraps around structural entity
"
Class {
	#name : #FASTVariableExpression,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTVariableExpression class >> annotation [

	<MSEClass: #VariableExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTVariableExpression class >> generatedSlotNames [
	<generated>
	'FASTVariableExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTVariableExpression class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTVariableExpression class >> requirements [

	<generated>
	^ {  }
]

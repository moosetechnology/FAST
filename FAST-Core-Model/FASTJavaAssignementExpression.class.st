"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignementExpression,
	#superclass : #FASTExpression,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignementExpression class >> annotation [

	<MSEClass: #JavaAssignementExpression super: #FASTExpression>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaAssignementExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaAssignementExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaAssignementExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaAssignementExpression class >> requirements [

	<generated>
	^ {  }
]

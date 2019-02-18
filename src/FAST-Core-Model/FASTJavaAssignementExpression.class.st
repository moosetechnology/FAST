"
An assignment expression mode.

Contains a referances to an assignee assignee and the expression that's being assigned.
"
Class {
	#name : #FASTJavaAssignementExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'expression',
		'variable'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaAssignementExpression class >> annotation [

	<MSEClass: #JavaAssignementExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaAssignementExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaAssignementExpression class>>#generatedSlotNames'.
	^ #(expression variable)
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

{ #category : #accessing }
FASTJavaAssignementExpression >> expression [

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'Expression that s being assigned upon declaration to the var'>
	^ expression
]

{ #category : #accessing }
FASTJavaAssignementExpression >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #accessing }
FASTJavaAssignementExpression >> variable [

	<MSEProperty: #variable type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'Variable that s being assigned'>
	^ variable
]

{ #category : #accessing }
FASTJavaAssignementExpression >> variable: anObject [

	<generated>
	variable := anObject

]

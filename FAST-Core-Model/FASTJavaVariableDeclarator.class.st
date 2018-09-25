"
A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.
"
Class {
	#name : #FASTJavaVariableDeclarator,
	#superclass : #FASTEntity,
	#instVars : [
		'expression',
		'variable'
	],
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableDeclarator class >> annotation [

	<MSEClass: #JavaVariableDeclarator super: #FASTEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaVariableDeclarator class >> generatedSlotNames [
	<generated>
	'FASTJavaVariableDeclarator class>>#generatedSlotNames'.
	^ #(expression variable)
]

{ #category : #generator }
FASTJavaVariableDeclarator class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaVariableDeclarator class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression [

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'Expression that s being assigned upon declaration to the var'>
	^ expression
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable [

	<MSEProperty: #variable type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'Variable that s being declared'>
	^ variable
]

{ #category : #accessing }
FASTJavaVariableDeclarator >> variable: anObject [

	<generated>
	variable := anObject

]

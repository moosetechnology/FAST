"
Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6
"
Class {
	#name : #FASTJavaInfixOperation,
	#superclass : #FASTExpression,
	#instVars : [
		'operator'
	],
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaInfixOperation class >> annotation [

	<MSEClass: #JavaInfixOperation super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaInfixOperation class >> generatedSlotNames [
	<generated>
	'FASTJavaInfixOperation class>>#generatedSlotNames'.
	^ #(operator)
]

{ #category : #generator }
FASTJavaInfixOperation class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaInfixOperation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator [

	<MSEProperty: #operator type: #String>
	<generated>
	<MSEComment: 'operator s symbol'>
	^ operator
]

{ #category : #accessing }
FASTJavaInfixOperation >> operator: anObject [

	<generated>
	operator := anObject

]

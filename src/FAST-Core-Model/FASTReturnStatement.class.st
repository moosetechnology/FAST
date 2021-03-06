"
A return statement node. Contains a reference to the expression which is returned.  
"
Class {
	#name : #FASTReturnStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#expression => FMOne type: #FASTExpression opposite: #returnOwner'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTReturnStatement class >> annotation [

	<FMClass: #ReturnStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTReturnStatement >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #returnOwner"

	<generated>
	<FMComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTReturnStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTReturnStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

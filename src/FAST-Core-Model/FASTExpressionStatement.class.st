"
A node of a statement which is representing a single expression. 
"
Class {
	#name : #FASTExpressionStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#expression => FMOne type: #FASTExpression opposite: #expressionStatementOwner'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTExpressionStatement class >> annotation [

	<FMClass: #ExpressionStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTExpressionStatement >> expression [
	"Relation named: #expression type: #FASTExpression opposite: #expressionStatementOwner"

	<generated>
	<FMComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTExpressionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseGroup with: self expression
]

"
An abstract superclass representing an expression node of a source code.
"
Class {
	#name : #FASTExpression,
	#superclass : #FASTEntitySourceAnchor,
	#traits : 'FASTTArgument',
	#classTraits : 'FASTTArgument classTrait',
	#instVars : [
		'#expressionStatementOwner => FMOne type: #FASTExpressionStatement opposite: #expression',
		'#returnOwner => FMOne type: #FASTReturnStatement opposite: #expression'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTExpression class >> annotation [

	<MSEClass: #Expression super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTExpression class >> requirements [

	<generated>
	^ { FASTExpressionStatement. FASTReturnStatement }
]

{ #category : #accessing }
FASTExpression >> expressionStatementOwner [
	"Relation named: #expressionStatementOwner type: #FASTExpressionStatement opposite: #expression"

	<generated>
	<MSEComment: 'The expression statement that own me (if it''s the case'>
	<container>
	^ expressionStatementOwner
]

{ #category : #accessing }
FASTExpression >> expressionStatementOwner: anObject [

	<generated>
	expressionStatementOwner := anObject

]

{ #category : #navigation }
FASTExpression >> expressionStatementOwnerGroup [
	<generated>
	<navigation: 'ExpressionStatementOwner'>
	^ MooseGroup with: self expressionStatementOwner
]

{ #category : #accessing }
FASTExpression >> returnOwner [
	"Relation named: #returnOwner type: #FASTReturnStatement opposite: #expression"

	<generated>
	<MSEComment: 'The return statement that own the expression (if it''s the case)'>
	<container>
	^ returnOwner
]

{ #category : #accessing }
FASTExpression >> returnOwner: anObject [

	<generated>
	returnOwner := anObject

]

{ #category : #navigation }
FASTExpression >> returnOwnerGroup [
	<generated>
	<navigation: 'ReturnOwner'>
	^ MooseGroup with: self returnOwner
]

"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body
"
Class {
	#name : #FASTBehaviouralEntity,
	#superclass : #FASTScopableEntity,
	#instVars : [
		'#parameters => FMMany type: #FASTVariableExpression opposite: #parentBehaviouralEntity',
		'#statementBlock => FMOne type: #FASTStatementBlock opposite: #fastBehaviouralParent'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTBehaviouralEntity class >> annotation [

	<MSEClass: #BehaviouralEntity super: #FASTScopableEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTBehaviouralEntity >> addParameters: anObject [
			
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
FASTBehaviouralEntity >> parameters [

	<generated>
	<MSEComment: 'Parameters of the method'>
	^ parameters
]

{ #category : #accessing }
FASTBehaviouralEntity >> parameters: anObject [

	<generated>
	parameters value: anObject

]

{ #category : #navigation }
FASTBehaviouralEntity >> parametersGroup [

	<generated>
	<navigation: 'Parameters'>
	^ MooseGroup
			withAll: (self parameters asSet)
]

{ #category : #accessing }
FASTBehaviouralEntity >> statementBlock [

	<generated>
	<MSEComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : #accessing }
FASTBehaviouralEntity >> statementBlock: anObject [

	<generated>
	statementBlock := anObject

]

{ #category : #navigation }
FASTBehaviouralEntity >> statementBlockGroup [

	<generated>
	<navigation: 'StatementBlock'>
	^ MooseGroup
			with: (self statementBlock)
]

"
A block of statements as ones in C-like langs with {}
"
Class {
	#name : #FASTStatementBlock,
	#superclass : #FASTStatement,
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTBehaviouralEntity opposite: #statementBlock',
		'#statements => FMMany type: #FASTStatement opposite: #statementContainer'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTStatementBlock class >> annotation [

	<MSEClass: #StatementBlock super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTStatementBlock class >> generatedSlotNames [
	<generated>
	'FASTStatementBlock class>>#generatedSlotNames'.
	^ #(fastBehaviouralParent statements)
]

{ #category : #generator }
FASTStatementBlock class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTStatementBlock class >> requirements [

	<generated>
	^ { FASTBehaviouralEntity }
]

{ #category : #adding }
FASTStatementBlock >> addStatements: anObject [
			
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTStatementBlock >> fastBehaviouralParent [

	<generated>
	<MSEComment: 'Behavioural entity containing the statement block.'>
	<container>

	^ fastBehaviouralParent
]

{ #category : #accessing }
FASTStatementBlock >> fastBehaviouralParent: anObject [

	<generated>
	fastBehaviouralParent := anObject

]

{ #category : #navigation }
FASTStatementBlock >> fastBehaviouralParentGroup [

	<generated>
	<navigation: 'FastBehaviouralParent'>
	^ MooseGroup
			with: (self fastBehaviouralParent)
]

{ #category : #accessing }
FASTStatementBlock >> statements [

	<generated>
	<MSEComment: 'Statements enclosed in this block'>
	^ statements
]

{ #category : #accessing }
FASTStatementBlock >> statements: anObject [

	<generated>
	statements value: anObject

]

{ #category : #navigation }
FASTStatementBlock >> statementsGroup [

	<generated>
	<navigation: 'Statements'>
	^ MooseGroup
			withAll: (self statements asSet)
]

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

	<FMClass: #StatementBlock super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTStatementBlock >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTBehaviouralEntity opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
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
	^ MooseGroup with: self fastBehaviouralParent
]

{ #category : #accessing }
FASTStatementBlock >> statements [
	"Relation named: #statements type: #FASTStatement opposite: #statementContainer"

	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
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
	^ MooseGroup withAll: self statements asSet
]

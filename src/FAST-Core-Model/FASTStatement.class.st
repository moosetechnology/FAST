"
An abstract subclass which represents a source code statemnet 
"
Class {
	#name : #FASTStatement,
	#superclass : #FASTScopableEntity,
	#instVars : [
		'#statementContainer => FMOne type: #FASTStatementBlock opposite: #statements'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTStatement class >> annotation [

	<MSEClass: #Statement super: #FASTScopableEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTStatement class >> requirements [

	<generated>
	^ { FASTStatementBlock }
]

{ #category : #accessing }
FASTStatement >> statementContainer [

	<generated>
	<MSEComment: 'Block containing this statement.'>
	<container>

	^ statementContainer
]

{ #category : #accessing }
FASTStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject

]

{ #category : #navigation }
FASTStatement >> statementContainerGroup [

	<generated>
	<navigation: 'StatementContainer'>
	^ MooseGroup
			with: (self statementContainer)
]

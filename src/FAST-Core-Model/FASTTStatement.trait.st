"
An abstract subclass which represents a source code statemnet 

## Relations
======================

### Parents
- Relation: #statementContainer Type: #FASTTStatementBlock Opposite: #statements Comment: Block containing this statement.

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTStatement,
	#instVars : [
		'#statementContainer => FMOne type: #FASTTStatementBlock opposite: #statements'
	],
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTStatement classSide >> annotation [

	<FMClass: #TStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #testing }
FASTTStatement >> isStatement [

	<generated>
	^ true
]

{ #category : #accessing }
FASTTStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTTStatementBlock opposite: #statements"

	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : #accessing }
FASTTStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject
]

{ #category : #navigation }
FASTTStatement >> statementContainerGroup [
	<generated>
	<navigation: 'StatementContainer'>
	^ MooseSpecializedGroup with: self statementContainer
]

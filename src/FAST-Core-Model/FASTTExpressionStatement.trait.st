"
A node of a statement which is representing a single expression. 

## Relations
======================

### Parents
- Relation: #statementContainer Type: #FASTTStatementBlock Opposite: #statements Comment: Block containing this statement.
### Children
- Relation: #expression Type: #FASTTExpression Opposite: #expressionStatementOwner Comment: The expression of the statement

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTExpressionStatement,
	#instVars : [
		'#expression => FMOne type: #FASTTExpression opposite: #expressionStatementOwner'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTExpressionStatement classSide >> annotation [

	<FMClass: #TExpressionStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTExpressionStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #expressionStatementOwner"

	<generated>
	<FMComment: 'The expression of the statement'>
	^ expression
]

{ #category : #accessing }
FASTTExpressionStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTTExpressionStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

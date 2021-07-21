"
A node of a statement which is representing a single expression. 
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
	^self
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

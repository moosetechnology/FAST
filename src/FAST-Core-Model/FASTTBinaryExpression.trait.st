"
A trait representing a binary expression of a node of a source code.

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTTWithArguments Opposite: #arguments Comment: my owner
- Relation: #expressionStatementOwner Type: #FASTTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #returnOwner Type: #FASTTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
### Other
- Relation: #assignedIn Type: #FASTTAssignment Opposite: #expression Comment: Optional assignment where this expression is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTBinaryExpression,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTBinaryExpression classSide >> annotation [

	<FMClass: #TBinaryExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

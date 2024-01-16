"
A node that wraps around structural entity

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTTWithArguments Opposite: #arguments Comment: my owner
- Relation: #expressionStatementOwner Type: #FASTTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #returnOwner Type: #FASTTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
### Other
- Relation: #assignedIn Type: #FASTTAssignment Opposite: #expression Comment: Optional assignment where this expression is used
- Relation: #invokedIn Type: #FASTTInvocation Opposite: #invoked Comment: Optional invocation where this name is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTVariableExpression,
	#traits : 'FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTVariableExpression classSide >> annotation [

	<FMClass: #TVariableExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

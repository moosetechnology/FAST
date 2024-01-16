"
A node representing an assignment

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTTWithArguments Opposite: #arguments Comment: my owner
- Relation: #expressionStatementOwner Type: #FASTTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #returnOwner Type: #FASTTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
### Other
- Relation: #assignedIn Type: #FASTTAssignment Opposite: #expression Comment: Optional assignment where this expression is used
- Relation: #expression Type: #FASTTExpression Opposite: #assignedIn Comment: Assigned expression (rhs of assignment)
- Relation: #variable Type: #FASTTVariableEntity Opposite: #parentAssignmentExpression Comment: An assigned variable (lhs of assignment)

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTAssignment,
	#instVars : [
		'#expression => FMOne type: #FASTTExpression opposite: #assignedIn',
		'#variable => FMOne type: #FASTTVariableEntity opposite: #parentAssignmentExpression'
	],
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTAssignment classSide >> annotation [

	<FMClass: #TAssignment super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTAssignment >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #assignedIn"

	<generated>
	<FMComment: 'Assigned expression (rhs of assignment)'>
	^ expression
]

{ #category : #accessing }
FASTTAssignment >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #accessing }
FASTTAssignment >> variable [
	"Relation named: #variable type: #FASTTVariableEntity opposite: #parentAssignmentExpression"

	<generated>
	<FMComment: 'An assigned variable (lhs of assignment)'>
	^ variable
]

{ #category : #accessing }
FASTTAssignment >> variable: anObject [

	<generated>
	variable := anObject
]

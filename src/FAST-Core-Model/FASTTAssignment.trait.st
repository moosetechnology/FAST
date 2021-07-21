"
A node representing an assignement
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
	^self
]

{ #category : #accessing }
FASTTAssignment >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #assignedIn"

	<generated>
	<FMComment: 'Assigned expression (rhs of assignement)'>
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
	<FMComment: 'An assigned variable (lhs of assignement)'>
	^ variable
]

{ #category : #accessing }
FASTTAssignment >> variable: anObject [

	<generated>
	variable := anObject
]

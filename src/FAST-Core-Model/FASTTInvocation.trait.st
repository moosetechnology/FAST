"
A invocation of a behavioural entity

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTTWithArguments Opposite: #arguments Comment: my owner
- Relation: #expressionStatementOwner Type: #FASTTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #returnOwner Type: #FASTTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
### Children
- Relation: #arguments Type: #FASTTExpression Opposite: #argumentOwner Comment: My arguments
### Other
- Relation: #assignedIn Type: #FASTTAssignment Opposite: #expression Comment: Optional assignment where this expression is used
- Relation: #invoked Type: #FASTTNamedEntity Opposite: #invokedIn Comment: The name of the behavioural invoked

## Properties
======================

- Named: #endPos Type: Number
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTInvocation,
	#instVars : [
		'#invoked => FMOne type: #FASTTNamedEntity opposite: #invokedIn'
	],
	#traits : 'FASTTExpression + FASTTWithArguments',
	#classTraits : 'FASTTExpression classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTInvocation >> invoked [
	"Relation named: #invoked type: #FASTTNamedEntity opposite: #invokedIn"

	<generated>
	<FMComment: 'The name of the behavioural invoked'>
	^ invoked
]

{ #category : #accessing }
FASTTInvocation >> invoked: anObject [

	<generated>
	invoked := anObject
]

"
An abstract superclass representing an expression node of a source code.

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
	#name : #FASTTExpression,
	#instVars : [
		'#argumentOwner => FMOne type: #FASTTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTTAssignment opposite: #expression',
		'#expressionStatementOwner => FMOne type: #FASTTExpressionStatement opposite: #expression',
		'#returnOwner => FMOne type: #FASTTReturnStatement opposite: #expression'
	],
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTExpression classSide >> annotation [

	<FMClass: #TExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTExpression >> argumentOwner [
	"Relation named: #argumentOwner type: #FASTTWithArguments opposite: #arguments"

	<generated>
	<FMComment: 'my owner'>
	<container>
	^ argumentOwner
]

{ #category : #accessing }
FASTTExpression >> argumentOwner: anObject [

	<generated>
	argumentOwner := anObject
]

{ #category : #navigation }
FASTTExpression >> argumentOwnerGroup [
	<generated>
	<navigation: 'ArgumentOwner'>
	^ MooseSpecializedGroup with: self argumentOwner
]

{ #category : #accessing }
FASTTExpression >> assignedIn [
	"Relation named: #assignedIn type: #FASTTAssignment opposite: #expression"

	<generated>
	<FMComment: 'Optional assignment where this expression is used'>
	<derived>
	^ assignedIn
]

{ #category : #accessing }
FASTTExpression >> assignedIn: anObject [

	<generated>
	assignedIn := anObject
]

{ #category : #accessing }
FASTTExpression >> expressionStatementOwner [
	"Relation named: #expressionStatementOwner type: #FASTTExpressionStatement opposite: #expression"

	<generated>
	<FMComment: 'The expression statement that own me (if it''s the case'>
	<container>
	<derived>
	^ expressionStatementOwner
]

{ #category : #accessing }
FASTTExpression >> expressionStatementOwner: anObject [

	<generated>
	expressionStatementOwner := anObject
]

{ #category : #navigation }
FASTTExpression >> expressionStatementOwnerGroup [
	<generated>
	<navigation: 'ExpressionStatementOwner'>
	^ MooseSpecializedGroup with: self expressionStatementOwner
]

{ #category : #accessing }
FASTTExpression >> returnOwner [
	"Relation named: #returnOwner type: #FASTTReturnStatement opposite: #expression"

	<generated>
	<FMComment: 'The return statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	^ returnOwner
]

{ #category : #accessing }
FASTTExpression >> returnOwner: anObject [

	<generated>
	returnOwner := anObject
]

{ #category : #navigation }
FASTTExpression >> returnOwnerGroup [
	<generated>
	<navigation: 'ReturnOwner'>
	^ MooseSpecializedGroup with: self returnOwner
]

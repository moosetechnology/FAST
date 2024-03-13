"
An abstract superclass representing an expression node of a source code.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `leftOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `rightOperand` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTTExpression,
	#instVars : [
		'#argumentOwner => FMOne type: #FASTTWithArguments opposite: #arguments',
		'#assignedIn => FMOne type: #FASTTAssignment opposite: #expression',
		'#expressionStatementOwner => FMOne type: #FASTTExpressionStatement opposite: #expression',
		'#parentExpression => FMOne type: #FASTTUnaryExpression opposite: #expression',
		'#parentExpressionLeft => FMOne type: #FASTTBinaryExpression opposite: #leftOperand',
		'#parentExpressionRight => FMOne type: #FASTTBinaryExpression opposite: #rightOperand',
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
	<container>
	<derived>
	^ assignedIn
]

{ #category : #accessing }
FASTTExpression >> assignedIn: anObject [

	<generated>
	assignedIn := anObject
]

{ #category : #navigation }
FASTTExpression >> assignedInGroup [
	<generated>
	<navigation: 'AssignedIn'>
	^ MooseSpecializedGroup with: self assignedIn
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
FASTTExpression >> parentExpression [
	"Relation named: #parentExpression type: #FASTTUnaryExpression opposite: #expression"

	<generated>
	<FMComment: 'Parent (unary) expression'>
	<container>
	<derived>
	^ parentExpression
]

{ #category : #accessing }
FASTTExpression >> parentExpression: anObject [

	<generated>
	parentExpression := anObject
]

{ #category : #navigation }
FASTTExpression >> parentExpressionGroup [
	<generated>
	<navigation: 'ParentExpression'>
	^ MooseSpecializedGroup with: self parentExpression
]

{ #category : #accessing }
FASTTExpression >> parentExpressionLeft [
	"Relation named: #parentExpressionLeft type: #FASTTBinaryExpression opposite: #leftOperand"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am left side'>
	<container>
	<derived>
	^ parentExpressionLeft
]

{ #category : #accessing }
FASTTExpression >> parentExpressionLeft: anObject [

	<generated>
	parentExpressionLeft := anObject
]

{ #category : #navigation }
FASTTExpression >> parentExpressionLeftGroup [
	<generated>
	<navigation: 'ParentExpressionLeft'>
	^ MooseSpecializedGroup with: self parentExpressionLeft
]

{ #category : #accessing }
FASTTExpression >> parentExpressionRight [
	"Relation named: #parentExpressionRight type: #FASTTBinaryExpression opposite: #rightOperand"

	<generated>
	<FMComment: 'Parent (binary) expression of which I am right side'>
	<container>
	<derived>
	^ parentExpressionRight
]

{ #category : #accessing }
FASTTExpression >> parentExpressionRight: anObject [

	<generated>
	parentExpressionRight := anObject
]

{ #category : #navigation }
FASTTExpression >> parentExpressionRightGroup [
	<generated>
	<navigation: 'ParentExpressionRight'>
	^ MooseSpecializedGroup with: self parentExpressionRight
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

"
A trait representing a binary expression of a node of a source code.

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

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `leftOperand` | `FASTTBinaryExpression` | `parentExpressionLeft` | `FASTTExpression` | left part of a binary expression|
| `rightOperand` | `FASTTBinaryExpression` | `parentExpressionRight` | `FASTTExpression` | left part of the expression|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `operator` | `String` | nil | Binary expression operator|
| `startPos` | `Number` | nil | |

"
Trait {
	#name : #FASTTBinaryExpression,
	#instVars : [
		'#leftOperand => FMOne type: #FASTTExpression opposite: #parentExpressionLeft',
		'#operator => FMProperty',
		'#rightOperand => FMOne type: #FASTTExpression opposite: #parentExpressionRight'
	],
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

{ #category : #accessing }
FASTTBinaryExpression >> leftOperand [
	"Relation named: #leftOperand type: #FASTTExpression opposite: #parentExpressionLeft"

	<generated>
	<FMComment: 'left part of a binary expression'>
	^ leftOperand
]

{ #category : #accessing }
FASTTBinaryExpression >> leftOperand: anObject [

	<generated>
	leftOperand := anObject
]

{ #category : #navigation }
FASTTBinaryExpression >> leftOperandGroup [
	<generated>
	<navigation: 'LeftOperand'>
	^ MooseSpecializedGroup with: self leftOperand
]

{ #category : #accessing }
FASTTBinaryExpression >> operator [

	<FMProperty: #operator type: #String>
	<generated>
	<FMComment: 'Binary expression operator'>
	^ operator
]

{ #category : #accessing }
FASTTBinaryExpression >> operator: anObject [
	<generated>
	operator := anObject
]

{ #category : #accessing }
FASTTBinaryExpression >> rightOperand [
	"Relation named: #rightOperand type: #FASTTExpression opposite: #parentExpressionRight"

	<generated>
	<FMComment: 'left part of the expression'>
	^ rightOperand
]

{ #category : #accessing }
FASTTBinaryExpression >> rightOperand: anObject [

	<generated>
	rightOperand := anObject
]

{ #category : #navigation }
FASTTBinaryExpression >> rightOperandGroup [
	<generated>
	<navigation: 'RightOperand'>
	^ MooseSpecializedGroup with: self rightOperand
]

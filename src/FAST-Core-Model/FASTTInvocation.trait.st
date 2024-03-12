"
A invocation of a behavioural entity

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentOwner` | `FASTTExpression` | `arguments` | `FASTTWithArguments` | my owner|
| `assignedIn` | `FASTTExpression` | `expression` | `FASTTAssignment` | Optional assignment where this expression is used|
| `expressionStatementOwner` | `FASTTExpression` | `expression` | `FASTTExpressionStatement` | The expression statement that own me (if it's the case|
| `parentExpression` | `FASTTExpression` | `expression` | `FASTTUnaryExpression` | Parent (unary) expression|
| `parentExpressionLeft` | `FASTTExpression` | `left` | `FASTTBinaryExpression` | Parent (binary) expression of which I am left side|
| `parentExpressionRight` | `FASTTExpression` | `right` | `FASTTBinaryExpression` | Parent (binary) expression of which I am right side|
| `returnOwner` | `FASTTExpression` | `expression` | `FASTTReturnStatement` | The return statement that own the expression (if it's the case)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `invoked` | `FASTTInvocation` | `invokedIn` | `FASTTNamedEntity` | The name of the behavioural invoked|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

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

{ #category : #navigation }
FASTTInvocation >> invokedGroup [
	<generated>
	<navigation: 'Invoked'>
	^ MooseSpecializedGroup with: self invoked
]

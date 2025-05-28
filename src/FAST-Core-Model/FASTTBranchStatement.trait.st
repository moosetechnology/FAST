"
I represent any statement that has several branches of execution (eg. swithcStatement, ifStatement)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTBranchStatement',
	#instVars : [
		'#branches => FMMany type: #FASTTStatement opposite: #parentBranchStatement',
		'#expression => FMOne type: #FASTTExpression opposite: #parentBranchStatement'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTBranchStatement classSide >> annotation [

	<FMClass: #TBranchStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTTBranchStatement >> addBranch: anObject [
	<generated>
	^ self branches add: anObject
]

{ #category : 'accessing' }
FASTTBranchStatement >> branches [
	"Relation named: #branches type: #FASTTStatement opposite: #parentBranchStatement"

	<generated>
	<FMComment: 'The various children branches of this BranchStatement'>
	<derived>
	^ branches
]

{ #category : 'accessing' }
FASTTBranchStatement >> branches: anObject [

	<generated>
	branches value: anObject
]

{ #category : 'navigation' }
FASTTBranchStatement >> branchesGroup [
	<generated>
	<navigation: 'Branches'>
	^ MooseSpecializedGroup withAll: self branches asSet
]

{ #category : 'accessing' }
FASTTBranchStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #parentBranchStatement"

	<generated>
	<FMComment: 'The expression commanding which branch is executed'>
	^ expression
]

{ #category : 'accessing' }
FASTTBranchStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTTBranchStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

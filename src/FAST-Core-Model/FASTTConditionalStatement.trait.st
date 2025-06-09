"
I represent any statement that has a boolean condition (eg. ifStatement)

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
	#name : 'FASTTConditionalStatement',
	#traits : 'FASTTBranchStatement',
	#classTraits : 'FASTTBranchStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTConditionalStatement classSide >> annotation [

	<FMClass: #TConditionalStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : '*FAST-Core-Visitor' }
FASTTConditionalStatement >> accept: aVisitor [
	^ aVisitor visitFASTTConditionalStatement: self
]

{ #category : 'accessing' }
FASTTConditionalStatement >> condition [
	"syntactic sugar"

	^self expression
]

{ #category : 'accessing' }
FASTTConditionalStatement >> condition: aBooleanExpression [
	"syntactic sugar"

	expression := aBooleanExpression 
]

{ #category : 'accessing' }
FASTTConditionalStatement >> falseBranch [
	"syntactic sugar"

	self mustHaveBranches: 2.
	^branches at: 2
]

{ #category : 'accessing' }
FASTTConditionalStatement >> falseBranch: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 2.
	(branches at: 2) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 2 put: aStatement.
	aStatement ifNotNil: [
		aStatement unsafeSet: #parentBranchStatement value: self ]

]

{ #category : 'accessing' }
FASTTConditionalStatement >> trueBranch [
	"syntactic sugar"

	self mustHaveBranches: 2.
	^branches at: 1 ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTTConditionalStatement >> trueBranch: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 2.
	(branches at: 1) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 1 put: aStatement.
	aStatement ifNotNil: [
		aStatement unsafeSet: #parentBranchStatement value: self ]

]

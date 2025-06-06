"
I represent any loop statement (for, while...)

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
	#name : 'FASTTLoopStatement',
	#traits : 'FASTTBranchStatement',
	#classTraits : 'FASTTBranchStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTLoopStatement classSide >> annotation [

	<FMClass: #TLoopStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : '*FAST-Core-Visitor' }
FASTTLoopStatement >> accept: aVisitor [
	^ aVisitor visitFASTTLoopStatement: self
]

{ #category : 'accessing' }
FASTTLoopStatement >> body [
	"syntactic sugar"

	self mustHaveBranches: 1.
	^branches at: 1 ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTTLoopStatement >> body: aStatement [
	"syntactic sugar"

	self mustHaveBranches: 1.
	(branches at: 1) ifNotNil: [ :oldValue | oldValue parentBranchStatement: nil ].
	branches at: 1 put: aStatement.
	aStatement unsafeSet: #parentBranchStatement value: self.

]

"
I represent any loop statement (for, while...)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|



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

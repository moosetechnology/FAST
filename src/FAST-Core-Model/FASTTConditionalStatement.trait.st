"
I represent any statement that has a boolean condition (eg. ifStatement)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `branches` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTStatement` | The various children branches of this BranchStatement|
| `expression` | `FASTTBranchStatement` | `parentBranchStatement` | `FASTTExpression` | The expression commanding which branch is executed|



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

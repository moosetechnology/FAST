"
I represent a break statement happening in loops. Break statement allows to cut the loop even if the condition is still valid. 

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTBreakStatement',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTBreakStatement classSide >> annotation [

	<FMClass: #TBreakStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTBreakStatement >> isBreakStatement [

	<generated>
	^ true
]

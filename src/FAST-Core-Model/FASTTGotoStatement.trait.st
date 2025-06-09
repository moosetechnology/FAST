"
I represent an unconditional jump statement (ie. a GOTO)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBranchStatement` | `FASTTStatement` | `branches` | `FASTTBranchStatement` | My parent BranchStatement (of which I am a branch)|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `label` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTGotoStatement',
	#instVars : [
		'#label => FMProperty'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTGotoStatement classSide >> annotation [

	<FMClass: #TGotoStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTTGotoStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	^ label
]

{ #category : 'accessing' }
FASTTGotoStatement >> label: anObject [
	<generated>
	label := anObject
]

"
I represent any loop statement (for, while...)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTTLoopStatement` | `parentLoopStatement` | `FASTTStatement` | The body of the loop|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTLoopStatement',
	#instVars : [
		'#body => FMOne type: #FASTTStatement opposite: #parentLoopStatement'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTLoopStatement classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TLoopStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTTLoopStatement >> body [
	"Relation named: #body type: #FASTTStatement opposite: #parentLoopStatement"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The body of the loop'>
	^ body
]

{ #category : 'accessing' }
FASTTLoopStatement >> body: anObject [

	<ignoreForCoverage>
	<generated>
	body := anObject
]

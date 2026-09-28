"
An abstract subclass which represents a source code statemnet 

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
	#name : 'FASTTStatement',
	#instVars : [
		'#parentLoopStatement => FMOne type: #FASTTLoopStatement opposite: #body',
		'#statementContainer => FMOne type: #FASTTStatementBlock opposite: #statements'
	],
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTStatement classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTStatement >> isStatement [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTTStatement >> parentLoopStatement [
	"Relation named: #parentLoopStatement type: #FASTTLoopStatement opposite: #body"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Optional loop of which this statement is the body'>
	<container>
	<derived>
	^ parentLoopStatement
]

{ #category : 'accessing' }
FASTTStatement >> parentLoopStatement: anObject [

	<ignoreForCoverage>
	<generated>
	parentLoopStatement := anObject
]

{ #category : 'accessing' }
FASTTStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTTStatementBlock opposite: #statements"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : 'accessing' }
FASTTStatement >> statementContainer: anObject [

	<ignoreForCoverage>
	<generated>
	statementContainer := anObject
]

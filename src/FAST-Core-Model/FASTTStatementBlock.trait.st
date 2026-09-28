"
A block of statements as ones in C-like langs with {}

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTStatementBlock',
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTTWithStatements opposite: #statementBlock',
		'#statements => FMMany type: #FASTTStatement opposite: #statementContainer'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTStatementBlock classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TStatementBlock super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'adding' }
FASTTStatementBlock >> addStatement: anObject [

	<ignoreForCoverage>
	<generated>
	^ self statements add: anObject
]

{ #category : 'accessing' }
FASTTStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTTWithStatements opposite: #statementBlock"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	^ fastBehaviouralParent
]

{ #category : 'accessing' }
FASTTStatementBlock >> fastBehaviouralParent: anObject [

	<ignoreForCoverage>
	<generated>
	fastBehaviouralParent := anObject
]

{ #category : 'testing' }
FASTTStatementBlock >> isStatementBlock [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTTStatementBlock >> statements [
	"Relation named: #statements type: #FASTTStatement opposite: #statementContainer"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
	^ statements
]

{ #category : 'accessing' }
FASTTStatementBlock >> statements: anObject [

	<ignoreForCoverage>
	<generated>
	statements value: anObject
]

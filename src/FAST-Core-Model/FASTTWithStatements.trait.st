"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|



"
Trait {
	#name : 'FASTTWithStatements',
	#instVars : [
		'#statementBlock => FMOne type: #FASTTStatementBlock opposite: #fastBehaviouralParent'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTWithStatements classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithStatements super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTTWithStatements >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #fastBehaviouralParent"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : 'accessing' }
FASTTWithStatements >> statementBlock: anObject [

	<ignoreForCoverage>
	<generated>
	statementBlock := anObject
]

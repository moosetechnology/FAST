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

	<FMClass: #TWithStatements super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTTWithStatements >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #fastBehaviouralParent"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : 'accessing' }
FASTTWithStatements >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : 'navigation' }
FASTTWithStatements >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]

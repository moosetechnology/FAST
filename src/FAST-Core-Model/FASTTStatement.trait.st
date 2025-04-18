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

	<FMClass: #TStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : '*FAST-Core-Visitor' }
FASTTStatement >> accept: aVisitor [
	^ aVisitor visitFASTTStatement: self
]

{ #category : 'testing' }
FASTTStatement >> isStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTTStatement >> parentLoopStatement [
	"Relation named: #parentLoopStatement type: #FASTTLoopStatement opposite: #body"

	<generated>
	<FMComment: 'Optional loop of which this statement is the body'>
	<container>
	<derived>
	^ parentLoopStatement
]

{ #category : 'accessing' }
FASTTStatement >> parentLoopStatement: anObject [

	<generated>
	parentLoopStatement := anObject
]

{ #category : 'navigation' }
FASTTStatement >> parentLoopStatementGroup [
	<generated>
	<navigation: 'ParentLoopStatement'>
	^ MooseSpecializedGroup with: self parentLoopStatement
]

{ #category : 'accessing' }
FASTTStatement >> statementContainer [
	"Relation named: #statementContainer type: #FASTTStatementBlock opposite: #statements"

	<generated>
	<FMComment: 'Block containing this statement.'>
	<container>
	^ statementContainer
]

{ #category : 'accessing' }
FASTTStatement >> statementContainer: anObject [

	<generated>
	statementContainer := anObject
]

{ #category : 'navigation' }
FASTTStatement >> statementContainerGroup [
	<generated>
	<navigation: 'StatementContainer'>
	^ MooseSpecializedGroup with: self statementContainer
]

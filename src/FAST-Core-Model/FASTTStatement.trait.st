"
An abstract subclass which represents a source code statemnet 

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
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTStatement',
	#instVars : [
		'#parentBranchStatement => FMOne type: #FASTTBranchStatement opposite: #branches',
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
FASTTStatement >> parentBranchStatement [
	"Relation named: #parentBranchStatement type: #FASTTBranchStatement opposite: #branches"

	<generated>
	<FMComment: 'My parent BranchStatement (of which I am a branch)'>
	<container>
	^ parentBranchStatement
]

{ #category : 'accessing' }
FASTTStatement >> parentBranchStatement: anObject [

	<generated>
	parentBranchStatement := anObject
]

{ #category : 'navigation' }
FASTTStatement >> parentBranchStatementGroup [
	<generated>
	<navigation: 'ParentBranchStatement'>
	^ MooseSpecializedGroup with: self parentBranchStatement
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

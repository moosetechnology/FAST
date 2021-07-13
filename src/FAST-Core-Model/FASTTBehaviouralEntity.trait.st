"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body
"
Trait {
	#name : #FASTTBehaviouralEntity,
	#instVars : [
		'#statementBlock => FMOne type: #FASTTStatementBlock opposite: #fastBehaviouralParent'
	],
	#traits : 'FASTTScopableEntity + FASTTWithParameters',
	#classTraits : 'FASTTScopableEntity classTrait + FASTTWithParameters classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTBehaviouralEntity classSide >> annotation [

	<FMClass: #TBehaviouralEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTBehaviouralEntity >> statementBlock [
	"Relation named: #statementBlock type: #FASTTStatementBlock opposite: #fastBehaviouralParent"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	^ statementBlock
]

{ #category : #accessing }
FASTTBehaviouralEntity >> statementBlock: anObject [

	<generated>
	statementBlock := anObject
]

{ #category : #navigation }
FASTTBehaviouralEntity >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]

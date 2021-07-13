"
A block of statements as ones in C-like langs with {}
"
Trait {
	#name : #FASTTStatementBlock,
	#instVars : [
		'#fastBehaviouralParent => FMOne type: #FASTTBehaviouralEntity opposite: #statementBlock',
		'#statements => FMMany type: #FASTTStatement opposite: #statementContainer'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTStatementBlock classSide >> annotation [

	<FMClass: #TStatementBlock super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTTStatementBlock >> addStatement: anObject [
	<generated>
	^ self statements add: anObject
]

{ #category : #accessing }
FASTTStatementBlock >> fastBehaviouralParent [
	"Relation named: #fastBehaviouralParent type: #FASTTBehaviouralEntity opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	^ fastBehaviouralParent
]

{ #category : #accessing }
FASTTStatementBlock >> fastBehaviouralParent: anObject [

	<generated>
	fastBehaviouralParent := anObject
]

{ #category : #navigation }
FASTTStatementBlock >> fastBehaviouralParentGroup [
	<generated>
	<navigation: 'FastBehaviouralParent'>
	^ MooseSpecializedGroup with: self fastBehaviouralParent
]

{ #category : #accessing }
FASTTStatementBlock >> statements [
	"Relation named: #statements type: #FASTTStatement opposite: #statementContainer"

	<generated>
	<FMComment: 'Statements enclosed in this block'>
	<derived>
	^ statements
]

{ #category : #accessing }
FASTTStatementBlock >> statements: anObject [

	<generated>
	statements value: anObject
]

{ #category : #navigation }
FASTTStatementBlock >> statementsGroup [
	<generated>
	<navigation: 'Statements'>
	^ MooseSpecializedGroup withAll: self statements asSet
]

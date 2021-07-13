"
A return statement node. Contains a reference to the expression which is returned.  
"
Trait {
	#name : #FASTTReturnStatement,
	#instVars : [
		'#expression => FMOne type: #FASTTExpression opposite: #returnOwner'
	],
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTReturnStatement classSide >> annotation [

	<FMClass: #TReturnStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTReturnStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #returnOwner"

	<generated>
	<FMComment: 'The expression returned'>
	^ expression
]

{ #category : #accessing }
FASTTReturnStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : #navigation }
FASTTReturnStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]

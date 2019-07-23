"
A node that wraps around structural entity
"
Class {
	#name : #FASTVariableExpression,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FASTBehaviouralEntity opposite: #parameters'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTVariableExpression class >> annotation [

	<MSEClass: #VariableExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTVariableExpression class >> requirements [

	<generated>
	^ { FASTBehaviouralEntity }
]

{ #category : #accessing }
FASTVariableExpression >> parentBehaviouralEntity [

	<generated>
	<MSEComment: 'A behavioual entity where this variable is defined as a parameter'>
	<container>

	^ parentBehaviouralEntity
]

{ #category : #accessing }
FASTVariableExpression >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject

]

{ #category : #navigation }
FASTVariableExpression >> parentBehaviouralEntityGroup [

	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup
			with: (self parentBehaviouralEntity)
]

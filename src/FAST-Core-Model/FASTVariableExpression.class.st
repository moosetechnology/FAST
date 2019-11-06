"
A node that wraps around structural entity
"
Class {
	#name : #FASTVariableExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTTModifier + FamixTNamed',
	#classTraits : 'FASTTModifier classTrait + FamixTNamed classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTVariableExpression class >> annotation [

	<FMClass: #VariableExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

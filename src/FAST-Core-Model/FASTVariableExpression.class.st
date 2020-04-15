"
A node that wraps around structural entity
"
Class {
	#name : #FASTVariableExpression,
	#superclass : #FASTExpression,
	#traits : 'FASTTParameter + FamixTNamedEntity',
	#classTraits : 'FASTTParameter classTrait + FamixTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTVariableExpression class >> annotation [

	<FMClass: #VariableExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

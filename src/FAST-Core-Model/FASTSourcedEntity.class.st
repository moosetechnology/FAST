Class {
	#name : #FASTSourcedEntity,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

Class {
	#name : #FASTComment,
	#superclass : #FASTSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTComment class >> annotation [

	<FMClass: #Comment super: #FASTSourcedEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

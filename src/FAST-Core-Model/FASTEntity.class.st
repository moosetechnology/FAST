"
any entity

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : #FASTEntity,
	#superclass : #MooseEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #meta }
FASTEntity class >> metamodel [

	<generated>
	^ FASTModel metamodel
]

{ #category : #testing }
FASTEntity >> isQueryable [

	<generated>
	^ false
]

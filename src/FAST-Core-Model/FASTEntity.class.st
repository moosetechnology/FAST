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
	#name : 'FASTEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : 'FAST-Core-Model-Entities',
	#package : 'FAST-Core-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'meta' }
FASTEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FASTModel metamodel
]

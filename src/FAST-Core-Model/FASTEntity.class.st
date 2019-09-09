Class {
	#name : #FASTEntity,
	#superclass : #MooseEntity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTMetamodelGenerator) metamodel
]

{ #category : #testing }
FASTEntity >> isAssociation [

	<generated>
	^ false
]

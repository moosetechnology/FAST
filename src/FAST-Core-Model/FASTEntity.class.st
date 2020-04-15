"
any entity
"
Class {
	#name : #FASTEntity,
	#superclass : #MooseEntity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTEntity class >> metamodel [

	<generated>
	^ FASTModel metamodel
]

{ #category : #accessing }
FASTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]

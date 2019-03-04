Class {
	#name : #FASTEntity,
	#superclass : #MooseEntity,
	#traits : 'TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#parentNode => FMOne type: #FASTEntity opposite: #childrenNode',
		'#childrenNode => FMMany type: #FASTEntity opposite: #parentNode'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTEntity class >> generatedSlotNames [
	<generated>
	'FASTEntity class>>#generatedSlotNames'.
	^ #(childrenNode parentNode)
]

{ #category : #generator }
FASTEntity class >> generatedTraitNames [
	<generated>
	^ #(TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FASTEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTEntity class >> requirements [

	<generated>
	^ { FASTEntity }
]

{ #category : #accessing }
FASTEntity >> belongsTo [

	<generated>
	^ self parentNode

]

{ #category : #accessing }
FASTEntity >> belongsTo: anObject [

	<generated>
	self parentNode: anObject

]

{ #category : #accessing }
FASTEntity >> childrenNode [

	<generated>
	^ childrenNode
]

{ #category : #accessing }
FASTEntity >> childrenNode: anObject [

	<generated>
	childrenNode value: anObject

]

{ #category : #navigation }
FASTEntity >> childrenNodeGroup [

	<generated>
	<navigation: 'ChildrenNode'>
	^ MooseGroup
			withAll: (self childrenNode asSet)
]

{ #category : #testing }
FASTEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
FASTEntity >> parentNode [

	<generated>
	<container>

	^ parentNode
]

{ #category : #accessing }
FASTEntity >> parentNode: anObject [

	<generated>
	parentNode := anObject

]

{ #category : #navigation }
FASTEntity >> parentNodeGroup [

	<generated>
	<navigation: 'ParentNode'>
	^ MooseGroup
			with: (self parentNode)
]

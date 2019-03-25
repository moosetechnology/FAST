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

{ #category : #generator }
FASTEntity class >> generatedSlotNames [
	<generated>
	'FASTEntity class>>#generatedSlotNames'.
	^ #()
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
	^ {  }
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

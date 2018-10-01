Class {
	#name : #FASTNamedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #MooseEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTNamedEntity class >> generatedSlotNames [
	<generated>
	'FASTNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTNamedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTNamedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTNamedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTNamedEntity >> isType [

	<generated>
	^ false
]

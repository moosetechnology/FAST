Class {
	#name : #FASTSourcedEntity,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTSourcedEntity class >> generatedSlotNames [
	<generated>
	'FASTSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTSourcedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTSourcedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourcedEntity >> isType [

	<generated>
	^ false
]

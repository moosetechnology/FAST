Class {
	#name : #FASTComment,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTComment class >> annotation [

	<MSEClass: #Comment super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTComment class >> generatedSlotNames [
	<generated>
	'FASTComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTComment class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTComment class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTComment class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTComment >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTComment >> isType [

	<generated>
	^ false
]

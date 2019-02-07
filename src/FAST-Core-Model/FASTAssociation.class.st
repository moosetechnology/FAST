Class {
	#name : #FASTAssociation,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTAssociation class >> annotation [

	<MSEClass: #Association super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTAssociation class >> generatedSlotNames [
	<generated>
	'FASTAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTAssociation class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTAssociation class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTAssociation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTAssociation >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTAssociation >> isType [

	<generated>
	^ false
]

Class {
	#name : #FASTJavaElsePartStatement,
	#superclass : #MooseEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaElsePartStatement class >> annotation [

	<MSEClass: #JavaElsePartStatement super: #MooseEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaElsePartStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaElsePartStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaElsePartStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaElsePartStatement class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTJavaElsePartStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTJavaElsePartStatement >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaElsePartStatement >> isType [

	<generated>
	^ false
]

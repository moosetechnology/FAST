Class {
	#name : #FASTSourceAnchor,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTSourceAnchor class >> generatedSlotNames [
	<generated>
	'FASTSourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourceAnchor class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTSourceAnchor class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTSourceAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTSourceAnchor >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceAnchor >> isType [

	<generated>
	^ false
]

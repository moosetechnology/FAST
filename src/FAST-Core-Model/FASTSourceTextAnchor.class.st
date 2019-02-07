Class {
	#name : #FASTSourceTextAnchor,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTSourceTextAnchor class >> generatedSlotNames [
	<generated>
	'FASTSourceTextAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourceTextAnchor class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTSourceTextAnchor class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTSourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTSourceTextAnchor >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceTextAnchor >> isType [

	<generated>
	^ false
]

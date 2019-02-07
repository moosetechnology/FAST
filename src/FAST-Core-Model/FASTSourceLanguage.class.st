Class {
	#name : #FASTSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #MooseEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTSourceLanguage class >> generatedSlotNames [
	<generated>
	'FASTSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTSourceLanguage >> isType [

	<generated>
	^ false
]

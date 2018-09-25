"
ExpressionStatements used at initialization phase of a for loop
"
Class {
	#name : #FASTJavaInitializersStatement,
	#superclass : #MooseEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaInitializersStatement class >> annotation [

	<MSEClass: #JavaInitializersStatement super: #MooseEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaInitializersStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaInitializersStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaInitializersStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaInitializersStatement class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTJavaInitializersStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTJavaInitializersStatement >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaInitializersStatement >> isType [

	<generated>
	^ false
]

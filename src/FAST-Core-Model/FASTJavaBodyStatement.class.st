"
A statement to be evaluated in the loop
"
Class {
	#name : #FASTJavaBodyStatement,
	#superclass : #MooseEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaBodyStatement class >> annotation [

	<MSEClass: #JavaBodyStatement super: #MooseEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaBodyStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaBodyStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaBodyStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaBodyStatement class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTJavaBodyStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTJavaBodyStatement >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaBodyStatement >> isType [

	<generated>
	^ false
]

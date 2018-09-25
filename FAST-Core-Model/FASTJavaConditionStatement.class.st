Class {
	#name : #FASTJavaConditionStatement,
	#superclass : #MooseEntity,
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaConditionStatement class >> annotation [

	<MSEClass: #JavaConditionStatement super: #MooseEntity>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaConditionStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaConditionStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaConditionStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaConditionStatement class >> metamodel [

	<generated>
	^ (self class environment at: #FASTJavaMetamodelGenerator) metamodel
]

{ #category : #meta }
FASTJavaConditionStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FASTJavaConditionStatement >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FASTJavaConditionStatement >> isType [

	<generated>
	^ false
]

"
Represents a method in FastJava
"
Class {
	#name : #FASTJavaMethodEntity,
	#superclass : #FASTNamedBehaviouralEntity,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodEntity class >> annotation [

	<MSEClass: #JavaMethodEntity super: #FASTNamedBehaviouralEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaMethodEntity class >> generatedSlotNames [
	<generated>
	'FASTJavaMethodEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaMethodEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FASTJavaMethodEntity class >> requirements [

	<generated>
	^ {  }
]

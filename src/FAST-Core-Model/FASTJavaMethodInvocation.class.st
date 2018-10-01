"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : 'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<MSEClass: #JavaMethodInvocation super: #FASTExpression>
	<package: #FAST>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedSlotNames [
	<generated>
	'FASTJavaMethodInvocation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTJavaMethodInvocation class >> requirements [

	<generated>
	^ {  }
]

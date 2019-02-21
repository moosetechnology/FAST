Class {
	#name : #FASTSourceTextAnchor,
	#superclass : #FASTSourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FASTSourceAnchor>
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
	^ #(FamixTWithImmediateSource)
]

{ #category : #meta }
FASTSourceTextAnchor class >> requirements [

	<generated>
	^ {  }
]

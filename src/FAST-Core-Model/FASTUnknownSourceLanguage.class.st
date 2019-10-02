Class {
	#name : #FASTUnknownSourceLanguage,
	#superclass : #FASTSourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FASTSourceLanguage>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

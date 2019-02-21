Class {
	#name : #FASTSourceAnchor,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTSourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FASTEntity>
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
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FASTSourceAnchor class >> requirements [

	<generated>
	^ {  }
]

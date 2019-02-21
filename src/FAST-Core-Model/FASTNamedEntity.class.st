Class {
	#name : #FASTNamedEntity,
	#superclass : #FASTEntitySourceAnchor,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FASTEntitySourceAnchor>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTNamedEntity class >> generatedSlotNames [
	<generated>
	'FASTNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FASTNamedEntity class >> requirements [

	<generated>
	^ {  }
]

Class {
	#name : #FASTAssociation,
	#superclass : #FASTSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTAssociation class >> annotation [

	<MSEClass: #Association super: #FASTSourcedEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTAssociation class >> generatedSlotNames [
	<generated>
	'FASTAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FASTAssociation class >> requirements [

	<generated>
	^ {  }
]

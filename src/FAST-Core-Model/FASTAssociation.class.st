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

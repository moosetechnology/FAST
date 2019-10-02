Class {
	#name : #FASTModel,
	#superclass : #MooseModel,
	#category : #'FAST-Core-Model'
}

{ #category : #meta }
FASTModel class >> annotation [
	<MSEClass: #FASTModel super: #MooseModel>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : #initialization }
FASTModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #FASTMetamodelGenerator) metamodel
]

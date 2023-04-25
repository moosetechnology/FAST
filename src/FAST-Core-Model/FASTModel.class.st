Class {
	#name : #FASTModel,
	#superclass : #MooseModel,
	#traits : 'FASTTEntityCreator',
	#classTraits : 'FASTTEntityCreator classTrait',
	#category : #'FAST-Core-Model-Model'
}

{ #category : #accessing }
FASTModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FASTModel class >> annotation [
	<FMClass: #FASTModel super: #MooseModel>
	<package: #'FAST-Core-Model'>
	<generated>
]

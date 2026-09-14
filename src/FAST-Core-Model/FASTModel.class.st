Class {
	#name : 'FASTModel',
	#superclass : 'MooseModel',
	#traits : 'FASTTEntityCreator',
	#classTraits : 'FASTTEntityCreator classTrait',
	#category : 'FAST-Core-Model-Model',
	#package : 'FAST-Core-Model',
	#tag : 'Model'
}

{ #category : 'accessing' }
FASTModel class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FASTModel class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #'FAST-Core-Model'>
	<generated>
]

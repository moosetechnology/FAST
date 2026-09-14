"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FASTTEntityCreator',
	#category : 'FAST-Core-Model-Model',
	#package : 'FAST-Core-Model',
	#tag : 'Model'
}

{ #category : 'meta' }
FASTTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'entity creation' }
FASTTEntityCreator >> newEntity [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTEntity new
]

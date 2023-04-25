"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FASTTEntityCreator,
	#category : #'FAST-Core-Model-Model'
}

{ #category : #meta }
FASTTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FASTTEntityCreator >> newEntity [

	<generated>
	^ self add: FASTEntity new
]

"
Represent everything that can be a variable. Useful for the LocalResolver and the SSA builder.


"
Trait {
	#name : 'FASTTCanBeVariable',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTCanBeVariable classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TCanBeVariable super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTCanBeVariable >> canBeVariable [

	<ignoreForCoverage>
	<generated>
	^ true
]

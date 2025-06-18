"
A statement that can be ""interrupted"" like a break in Java loop or exit in fortran loop.
	(this is only a marker, there is no property attached to it)


"
Trait {
	#name : 'FASTTBreakableStatement',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTBreakableStatement classSide >> annotation [

	<FMClass: #TBreakableStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'testing' }
FASTTBreakableStatement >> isBreakableStatement [

	<generated>
	^ true
]

"
I represent a continue statement happening in loops. Continue allows to cut the loop even if the condition is still valid, but on the contrary of a break, is still execute the next loops. 


"
Trait {
	#name : 'FASTTContinueStatement',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTContinueStatement classSide >> annotation [

	<FMClass: #TContinueStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTContinueStatement >> isContinueStatement [

	<generated>
	^ true
]

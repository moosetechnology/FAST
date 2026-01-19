Trait {
	#name : 'FASTTCFGVisitor',
	#instVars : [
		'#cfgBuilder => FMProperty'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'accessing' }
FASTTCFGVisitor >> cfgBuilder [

	^ cfgBuilder
]

{ #category : 'accessing' }
FASTTCFGVisitor >> cfgBuilder: anObject [

	cfgBuilder := anObject
]

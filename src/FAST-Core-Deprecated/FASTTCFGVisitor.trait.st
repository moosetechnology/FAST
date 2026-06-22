Trait {
	#name : 'FASTTCFGVisitor',
	#instVars : [
		'#cfgBuilder => FMProperty'
	],
	#category : 'FAST-Core-Deprecated',
	#package : 'FAST-Core-Deprecated'
}

{ #category : 'testing' }
FASTTCFGVisitor classSide >> isDeprecated [

	^ true
]

{ #category : 'accessing' }
FASTTCFGVisitor >> cfgBuilder [

	^ cfgBuilder
]

{ #category : 'accessing' }
FASTTCFGVisitor >> cfgBuilder: anObject [

	cfgBuilder := anObject
]

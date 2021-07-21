"
A invocation of a behavioural entity
"
Trait {
	#name : #FASTTInvocation,
	#instVars : [
		'#invoked => FMOne type: #FASTTNamedEntity opposite: #invokedIn'
	],
	#traits : 'FASTTExpression + FASTTWithArguments',
	#classTraits : 'FASTTExpression classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTInvocation classSide >> annotation [

	<FMClass: #TInvocation super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTInvocation >> invoked [
	"Relation named: #invoked type: #FASTTNamedEntity opposite: #invokedIn"

	<generated>
	<FMComment: 'The name of the behavioural invoked'>
	^ invoked
]

{ #category : #accessing }
FASTTInvocation >> invoked: anObject [

	<generated>
	invoked := anObject
]

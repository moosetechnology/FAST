"
A entity with a name
"
Trait {
	#name : #FASTTNamedEntity,
	#instVars : [
		'#invokedIn => FMOne type: #FASTTInvocation opposite: #invoked',
		'#name => FMProperty'
	],
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTNamedEntity classSide >> annotation [

	<FMClass: #TNamedEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTNamedEntity >> invokedIn [
	"Relation named: #invokedIn type: #FASTTInvocation opposite: #invoked"

	<generated>
	<FMComment: 'Optional invocation where this name is used'>
	<derived>
	^ invokedIn
]

{ #category : #accessing }
FASTTNamedEntity >> invokedIn: anObject [

	<generated>
	invokedIn := anObject
]

{ #category : #accessing }
FASTTNamedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FASTTNamedEntity >> name: anObject [
	<generated>
	name := anObject
]

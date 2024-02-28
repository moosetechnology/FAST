"
A entity with a name

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

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
	<container>
	<derived>
	^ invokedIn
]

{ #category : #accessing }
FASTTNamedEntity >> invokedIn: anObject [

	<generated>
	invokedIn := anObject
]

{ #category : #navigation }
FASTTNamedEntity >> invokedInGroup [
	<generated>
	<navigation: 'InvokedIn'>
	^ MooseSpecializedGroup with: self invokedIn
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

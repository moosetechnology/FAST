"
I have parameters

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|



"
Trait {
	#name : 'FASTTWithParameters',
	#instVars : [
		'#parameters => FMMany type: #FASTTVariableEntity opposite: #parameterOwner'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTWithParameters classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithParameters super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'adding' }
FASTTWithParameters >> addParameter: anObject [

	<ignoreForCoverage>
	<generated>
	^ self parameters add: anObject
]

{ #category : 'accessing' }
FASTTWithParameters >> parameters [
	"Relation named: #parameters type: #FASTTVariableEntity opposite: #parameterOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My parameters'>
	<derived>
	^ parameters
]

{ #category : 'accessing' }
FASTTWithParameters >> parameters: anObject [

	<ignoreForCoverage>
	<generated>
	parameters value: anObject
]

"
I have arguments

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|



"
Trait {
	#name : 'FASTTWithArguments',
	#instVars : [
		'#arguments => FMMany type: #FASTTExpression opposite: #argumentOwner'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTWithArguments classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithArguments super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'adding' }
FASTTWithArguments >> addArgument: anObject [

	<ignoreForCoverage>
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FASTTWithArguments >> arguments [
	"Relation named: #arguments type: #FASTTExpression opposite: #argumentOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'My arguments'>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FASTTWithArguments >> arguments: anObject [

	<ignoreForCoverage>
	<generated>
	arguments value: anObject
]

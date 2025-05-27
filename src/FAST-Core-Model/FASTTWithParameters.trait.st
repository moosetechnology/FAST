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

	<FMClass: #TWithParameters super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'visiting' }
FASTTWithParameters >> accept: aVisitor [
	^ aVisitor visitFASTTWithParameters: self
]

{ #category : 'adding' }
FASTTWithParameters >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : 'accessing' }
FASTTWithParameters >> parameters [
	"Relation named: #parameters type: #FASTTVariableEntity opposite: #parameterOwner"

	<generated>
	<FMComment: 'My parameters'>
	<derived>
	^ parameters
]

{ #category : 'accessing' }
FASTTWithParameters >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : 'navigation' }
FASTTWithParameters >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseSpecializedGroup withAll: self parameters asSet
]

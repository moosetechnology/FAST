"
I have parameters
"
Trait {
	#name : #FASTTWithModifiers,
	#instVars : [
		'#parameters => FMMany type: #FASTTModifier opposite: #parameterOwner'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTWithModifiers classSide >> annotation [

	<FMClass: #TWithModifiers super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTTWithModifiers >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
FASTTWithModifiers >> parameters [
	"Relation named: #parameters type: #FASTTModifier opposite: #parameterOwner"

	<generated>
	<FMComment: 'My parameters'>
	<derived>
	^ parameters
]

{ #category : #accessing }
FASTTWithModifiers >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #navigation }
FASTTWithModifiers >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseGroup withAll: self parameters asSet
]

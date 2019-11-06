"
I can be a parameter
"
Trait {
	#name : #FASTTModifier,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTTWithModifiers opposite: #parameters'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTModifier classSide >> annotation [

	<FMClass: #TModifier super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTModifier >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTTWithModifiers opposite: #parameters"

	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : #accessing }
FASTTModifier >> parameterOwner: anObject [

	<generated>
	parameterOwner := anObject
]

{ #category : #navigation }
FASTTModifier >> parameterOwnerGroup [
	<generated>
	<navigation: 'ParameterOwner'>
	^ MooseGroup with: self parameterOwner
]

"
I can be a parameter
"
Trait {
	#name : #FASTTParameter,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTTWithParameters opposite: #parameters'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTParameter classSide >> annotation [

	<FMClass: #TParameter super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTParameter >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : #accessing }
FASTTParameter >> parameterOwner: anObject [

	<generated>
	parameterOwner := anObject
]

{ #category : #navigation }
FASTTParameter >> parameterOwnerGroup [
	<generated>
	<navigation: 'ParameterOwner'>
	^ MooseGroup with: self parameterOwner
]

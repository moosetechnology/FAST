"
I can be an argument
"
Trait {
	#name : #FASTTArgument,
	#instVars : [
		'#argumentOwner => FMOne type: #FASTTWithArguments opposite: #arguments'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTArgument classSide >> annotation [

	<FMClass: #TArgument super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTArgument >> argumentOwner [
	"Relation named: #argumentOwner type: #FASTTWithArguments opposite: #arguments"

	<generated>
	<FMComment: 'my owner'>
	<container>
	^ argumentOwner
]

{ #category : #accessing }
FASTTArgument >> argumentOwner: anObject [

	<generated>
	argumentOwner := anObject
]

{ #category : #navigation }
FASTTArgument >> argumentOwnerGroup [
	<generated>
	<navigation: 'ArgumentOwner'>
	^ MooseGroup with: self argumentOwner
]

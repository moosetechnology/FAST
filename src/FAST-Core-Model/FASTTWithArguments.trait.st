"
I have arguments
"
Trait {
	#name : #FASTTWithArguments,
	#instVars : [
		'#arguments => FMMany type: #FASTTArgument opposite: #argumentOwner'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTWithArguments classSide >> annotation [

	<MSEClass: #TWithArguments super: #Trait>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTTWithArguments >> addArguments: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FASTTWithArguments >> arguments [
	"Relation named: #arguments type: #FASTTArgument opposite: #argumentOwner"

	<generated>
	<MSEComment: 'My arguments'>
	^ arguments
]

{ #category : #accessing }
FASTTWithArguments >> arguments: anObject [

	<generated>
	arguments value: anObject

]

{ #category : #navigation }
FASTTWithArguments >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseGroup withAll: self arguments asSet
]

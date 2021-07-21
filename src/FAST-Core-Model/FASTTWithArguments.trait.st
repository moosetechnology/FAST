"
I have arguments
"
Trait {
	#name : #FASTTWithArguments,
	#instVars : [
		'#arguments => FMMany type: #FASTTExpression opposite: #argumentOwner'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTWithArguments classSide >> annotation [

	<FMClass: #TWithArguments super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTTWithArguments >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FASTTWithArguments >> arguments [
	"Relation named: #arguments type: #FASTTExpression opposite: #argumentOwner"

	<generated>
	<FMComment: 'My arguments'>
	<derived>
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
	^ MooseSpecializedGroup withAll: self arguments asSet
]

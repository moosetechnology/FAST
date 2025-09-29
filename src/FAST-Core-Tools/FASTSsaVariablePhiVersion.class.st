Class {
	#name : 'FASTSsaVariablePhiVersion',
	#superclass : 'FASTSsaVariableVersion',
	#instVars : [
		'choices'
	],
	#category : 'FAST-Core-Tools',
	#package : 'FAST-Core-Tools'
}

{ #category : 'adding' }
FASTSsaVariablePhiVersion >> addChoiceToPhi: aPhiVersion [

	choices do: [ :v | v addChoiceToPhi: aPhiVersion ]
]

{ #category : 'accessing' }
FASTSsaVariablePhiVersion >> choices [

	^choices
]

{ #category : 'instance creation' }
FASTSsaVariablePhiVersion >> for: aCollection [

	localDeclaration := aCollection anyOne localDeclaration.
	version := nil.

	choices := OrderedCollection new.
	aCollection do: [ :v | v addChoiceToPhi: self ]

]

{ #category : 'accessing' }
FASTSsaVariablePhiVersion >> name [

	^'phi(' ,
	($, join: (choices collect: #name)) ,
	')'
]

{ #category : 'accessing' }
FASTSsaVariablePhiVersion >> version [

	^(choices collect: #version) max
]

{ #category : 'accessing' }
FASTSsaVariablePhiVersion >> version: anObject [

	self shouldNotImplement
]

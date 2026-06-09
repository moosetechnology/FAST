Class {
	#name : 'FASTVariablePhiVersionSSA',
	#superclass : 'FASTVariableVersionSSA',
	#instVars : [
		'choices'
	],
	#category : 'FAST-Core-Tools-SSA',
	#package : 'FAST-Core-Tools',
	#tag : 'SSA'
}

{ #category : 'adding' }
FASTVariablePhiVersionSSA >> addChoiceToPhi: aPhiVersion [

	choices do: [ :v | v addChoiceToPhi: aPhiVersion ]
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> choices [

	^choices
]

{ #category : 'instance creation' }
FASTVariablePhiVersionSSA >> for: aCollection [

	localDeclaration := aCollection anyOne localDeclaration.
	version := nil.

	choices := OrderedCollection new.
	aCollection do: [ :v | v addChoiceToPhi: self ]

]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> name [

	^'phi(' ,
	($, join: (choices collect: #name)) ,
	')'
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> version [

	^(choices collect: #version) max
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> version: anObject [

	self shouldNotImplement
]

Class {
	#name : 'FASTVariablePhiVersionSSA',
	#superclass : 'FASTAbstractVariableVersionSSA',
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

	choices := OrderedCollection new.
	aCollection do: [ :v | v addChoiceToPhi: self ]
]

{ #category : 'testing' }
FASTVariablePhiVersionSSA >> isPhi [

	^ true
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> name [

	^ 'phi(' , ($, join: (choices collect: #name)) , ')'
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> numberOfPossibleVariables [

	^ choices size
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> ssaVariables [

	^ choices
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> version [

	self deprecated:
		'It does not really makes sense to have a version for a Phi version. I propose to remove it once Fortran and Java SSA will not use this anymore.'.
	^ (choices collect: #version) max
]

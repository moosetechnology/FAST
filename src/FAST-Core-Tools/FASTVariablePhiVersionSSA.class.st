"
I am a phi version of a variable, created at a control-flow join point (for example at the end of an if statement or a loop) to merge the versions coming from the different branches.

I hold the versions I merge (`choices`) and the local declaration (`localDeclaration`) of the variable.

My name is built from the names of my choices, for example `phi(x_1, x_2)`.

I require the SSA resolution to have been run on the model before being used.
"
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

{ #category : 'meta' }
FASTVariablePhiVersionSSA class >> annotation [

	<FMClass: #VariablePhiVersionSSA super: #FASTAbstractVariableVersionSSA>
	<package: #'FAST-Core-Tools'>
	
]

{ #category : 'adding' }
FASTVariablePhiVersionSSA >> addChoiceToPhi: aPhiVersion [

	choices do: [ :v | v addChoiceToPhi: aPhiVersion ]
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> choices [

	<FMProperty: #choices type: #FASTVariableVersionSSA>
	<multivalued>
	<FMComment: 'List of the SSA variables I could represent.'>
	^ choices
]

{ #category : 'accessing' }
FASTVariablePhiVersionSSA >> choices: anObject [
	choices := anObject
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

"
A LinkingAction that associates a value to the link

For example, with a ""if"" statement, the `true` value is associated to the ""then"" statement and
the `false` value associated to the ""else"" statement
"
Class {
	#name : 'FASTCFGValuedLinkingAction',
	#superclass : 'FASTCFGUnconditionalLinkingAction',
	#instVars : [
		'value'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'execute' }
FASTCFGValuedLinkingAction >> runWith: successorBlock [

	active ifFalse: [ ^self ].

	predecessorBlock nextBlock: successorBlock onValue: value.
	active := false

]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> value [

	^value
]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> value: anObject [

	value := anObject
]

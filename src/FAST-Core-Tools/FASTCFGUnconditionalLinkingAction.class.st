"
A LinkingAction that executes unconditionally once.
After this it becomes unactive
"
Class {
	#name : 'FASTCFGUnconditionalLinkingAction',
	#superclass : 'FASTCFGPendingLinkingAction',
	#instVars : [
		'active'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'initialization' }
FASTCFGUnconditionalLinkingAction >> initialize [ 

	super initialize.

	active := true
]

{ #category : 'testing' }
FASTCFGUnconditionalLinkingAction >> isActive [

	^active
]

{ #category : 'execute' }
FASTCFGUnconditionalLinkingAction >> runWith: successorBlock [

	active ifFalse: [ ^self ].

	predecessorBlock nextBlock: successorBlock.
	active := false

]

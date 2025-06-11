"
A LinkingAction that executes unconditionally once.
After this it becomes unactive
"
Class {
	#name : 'FASTCFGUnconditionalLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGUnconditionalLinkingAction >> isActive [

	^active
]

{ #category : 'execute' }
FASTCFGUnconditionalLinkingAction >> runWith: successorBlock [

	active ifFalse: [ ^self ].

	predecessorBlock nextBlock: successorBlock.
	self active: false.

	^true
]

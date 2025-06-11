Class {
	#name : 'FASTCFGGotoLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'label'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGGotoLinkingAction >> isGotoAction [

	^true
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> label [

	^ label
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> label: anObject [

	label := anObject
]

{ #category : 'running' }
FASTCFGGotoLinkingAction >> runWith: successorBlock [

	(successorBlock label = label) ifFalse: [ ^false ].

	predecessorBlock nextBlock: successorBlock.
	self active: false.

	^true
]

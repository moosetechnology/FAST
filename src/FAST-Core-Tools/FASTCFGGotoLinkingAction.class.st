Class {
	#name : 'FASTCFGGotoLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'label',
		'predecessorBlock',
		'active'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> active [

	^ active
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> active: anObject [

	active := anObject
]

{ #category : 'testing' }
FASTCFGGotoLinkingAction >> isActive [

	^active
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> label [

	^ label
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> predecessorBlock [

	^ predecessorBlock
]

{ #category : 'accessing' }
FASTCFGGotoLinkingAction >> predecessorBlock: anObject [

	predecessorBlock := anObject
]

{ #category : 'running' }
FASTCFGGotoLinkingAction >> runWith: successorBlock [

	(successorBlock label = label) ifFalse: [ ^false ].

	predecessorBlock nextBlock: successorBlock.
	active := false.
	^true
]

"
A LinkingAction for a a block with a label.
It knows this `#label` to be able to check whether a later goto matches it or not
If it does, the goto will be predecessor of the `#successorBlock`
"
Class {
	#name : 'FASTCFGLabeledLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'label',
		'successorBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGLabeledLinkingAction >> isActive [

	^true
]

{ #category : 'accessing' }
FASTCFGLabeledLinkingAction >> label [

	^ label
]

{ #category : 'accessing' }
FASTCFGLabeledLinkingAction >> label: anObject [

	label := anObject
]

{ #category : 'execute' }
FASTCFGLabeledLinkingAction >> runWith: predecessorBlock [

	^false
]

{ #category : 'execute' }
FASTCFGLabeledLinkingAction >> runWith: predecessorBlock label: aLabel [

	(aLabel = label) ifFalse: [ ^false ].

	predecessorBlock nextBlock: successorBlock.
	^true
]

"
A LinkingAction that prepares to create a link between two blocks.

The action contains the predecessor in the link.
When it is executed, one must pass it the successor in the link.
For this there is a #withSuccessor: method

"
Class {
	#name : 'FASTCFGPendingLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'predecessorBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGPendingLinkingAction >> predecessorBlock [

	^ predecessorBlock
]

{ #category : 'accessing' }
FASTCFGPendingLinkingAction >> predecessorBlock: anObject [

	predecessorBlock := anObject
]

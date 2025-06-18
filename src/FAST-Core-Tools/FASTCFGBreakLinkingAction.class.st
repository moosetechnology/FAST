"
An action that will wait for the end of a breakableStatement to get the block that will follow it
"
Class {
	#name : 'FASTCFGBreakLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'getNextBlokAction',
		'basicBlocksToLink'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGBreakLinkingAction >> basicBlockToLink: aBasicBlock [

	self basicBlocksToLink add: aBasicBlock 
]

{ #category : 'accessing' }
FASTCFGBreakLinkingAction >> basicBlocksToLink [
	"basicBlocksToLink will typically have 0 or 1 basicBlock"

	^basicBlocksToLink ifNil: [ basicBlocksToLink := OrderedCollection new: 2 ]
]

{ #category : 'accessing' }
FASTCFGBreakLinkingAction >> getNextBlock [

	^getNextBlokAction value: self predecessorBlock 
]

{ #category : 'accessing' }
FASTCFGBreakLinkingAction >> getNextBlock: aPharoBlock [

	getNextBlokAction := aPharoBlock 
]

{ #category : 'running' }
FASTCFGBreakLinkingAction >> runWith: aBlock [

	self basicBlocksToLink do: [ :bbloc |
		bbloc nextBlock: (self getNextBlock)
	].

	self active: false.
]

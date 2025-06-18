"
A LinkingAction links two blocks.

The action has a method to tell whether it is #active (it can be executed) or not.

"
Class {
	#name : 'FASTCFGLinkingAction',
	#superclass : 'Object',
	#instVars : [
		'active',
		'predecessorBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGLinkingAction >> active: aBoolean [

	active := aBoolean 
]

{ #category : 'initialization' }
FASTCFGLinkingAction >> initialize [ 

	super initialize.

	active := true
]

{ #category : 'testing' }
FASTCFGLinkingAction >> isActive [

	^active
]

{ #category : 'testing' }
FASTCFGLinkingAction >> isGotoAction [

	^false
]

{ #category : 'accessing' }
FASTCFGLinkingAction >> predecessorBlock [

	^predecessorBlock
]

{ #category : 'accessing' }
FASTCFGLinkingAction >> predecessorBlock: anObject [

	predecessorBlock := anObject
]

{ #category : 'running' }
FASTCFGLinkingAction >> runWith: aBlock [

	self subclassResponsibility 
]

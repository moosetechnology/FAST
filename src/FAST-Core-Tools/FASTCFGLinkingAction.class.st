"
A LinkingAction links two blocks.

The action has a method to tell whether it is #active (it can be executed) or not.

"
Class {
	#name : 'FASTCFGLinkingAction',
	#superclass : 'Object',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGLinkingAction >> isActive [

	self subclassResponsibility
]

{ #category : 'running' }
FASTCFGLinkingAction >> runWith: aBlock [

	self subclassResponsibility 
]

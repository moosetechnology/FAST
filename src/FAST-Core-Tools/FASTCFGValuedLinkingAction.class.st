"
A LinkingAction that associates a value to the link. It is a decorated on another action.

For example, with a ""if"" statement, the `true` value is associated to the ""then"" statement and
the `false` value associated to the ""else"" statement
"
Class {
	#name : 'FASTCFGValuedLinkingAction',
	#superclass : 'FASTCFGLinkingAction',
	#instVars : [
		'value',
		'decoratedAction'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'execute' }
FASTCFGValuedLinkingAction >> active: aBoolean [

	decoratedAction active: aBoolean 
]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> decoratedAction [

	^decoratedAction
]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> decoratedAction: anAction [
	"replaces the decoratedAction predecessorBlock with a fake one"

	decoratedAction := anAction.

	predecessorBlock := anAction predecessorBlock.
	anAction predecessorBlock: FASTCFGNullBlock new.
	
]

{ #category : 'initialization' }
FASTCFGValuedLinkingAction >> initialize [ 

	super initialize.

	decoratedAction := FASTCFGNullBlock new
]

{ #category : 'execute' }
FASTCFGValuedLinkingAction >> isActive [

	^decoratedAction isActive 
]

{ #category : 'execute' }
FASTCFGValuedLinkingAction >> runWith: successorBlock [

	self isActive ifFalse: [ ^self ].

	(decoratedAction runWith: successorBlock)
		ifTrue: [self predecessorBlock nextBlock: successorBlock onValue: value]
]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> value [

	^value
]

{ #category : 'accessing' }
FASTCFGValuedLinkingAction >> value: anObject [

	value := anObject
]

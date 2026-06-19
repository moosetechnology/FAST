"
I am a context entry used to represent fall-through switches (switches where you need to add a break at the end of a case if you do not want to execute the code from the cases that follow the one validated by the input).
"
Class {
	#name : 'FASTCFGFallThroughSwitchContextEntry',
	#superclass : 'FASTCFGContextEntry',
	#instVars : [
		'fallThroughCase'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTCFGFallThroughSwitchContextEntry >> addNextBlock: aBlock [ 

	"If my last case had no break, i also add the new block to it."
	fallThroughCase ifNotNil: [ fallThroughCase addNextBlock: aBlock ].
	self conditional addNextBlock: aBlock.
	
	"I reset the fall-through case if needed, and check if this new case ends with a break or not."
	fallThroughCase := nil.
	aBlock statements last isBreakStatement ifFalse: [ fallThroughCase := aBlock ]
]

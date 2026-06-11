Class {
	#name : 'FASTGenericCFGBuilder',
	#superclass : 'Object',
	#instVars : [
		'basicBlocks',
		'currentBlock',
		'parentLoopBlocks',
		'pendingNextBlock',
		'cfgVisitor'
	],
	#category : 'FAST-Core-Deprecated',
	#package : 'FAST-Core-Deprecated'
}

{ #category : 'testing' }
FASTGenericCFGBuilder class >> isDeprecated [
	"A new implementation of CFG is available in FAST an will replace this one."

	^ true
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> addPendingNextBlockAction: settingAction [
	"settingAction is a pharo block with one argument (a BasicBlock) and is used to set the successor of another block
	 when we will know it
	 For now, sets the nextBlock to nil and register the settingAction for future use"

	settingAction value: nil.
	pendingNextBlock add: settingAction
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> basicBlocks [

	^ basicBlocks
]

{ #category : 'as yet unclassified' }
FASTGenericCFGBuilder >> buildCFGForModel: aFASTModel [

	aFASTModel accept: cfgVisitor.
	^ self basicBlocks detect: [ :block | block isStart ]
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> cfgVisitor [

	^ cfgVisitor
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> cfgVisitor: anObject [

	cfgVisitor := anObject.
	"setting the variable for double dispatch"
	cfgVisitor cfgBuilder: self
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> chainPendingBlocksTo: newBlock [

	pendingNextBlock copy do: [ :settingAction |
		self runChainAction: settingAction with: newBlock ].
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> closeCurrentBlock [

	currentBlock := nil
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> currentBlock [

	^ currentBlock
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> findParentLoopBlock: aLabel [
	"if there is no label to the EXIT, take the first loop block in the stack
	 otherwise, search for the loop with the right label"

	aLabel ifNil: [ ^parentLoopBlocks top ].
	^nil
]

{ #category : 'initialization' }
FASTGenericCFGBuilder >> initialize [

	super initialize.

	basicBlocks := OrderedCollection new.
	parentLoopBlocks := Stack new.
	pendingNextBlock := OrderedCollection new
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlock and set it to currentBlock
	 typically called inside: `currentBlock nextBlock: (self newBasicBlock:)` to chain the new block
	 to the previous currentBlock"

	| newBlock |
	newBlock := aBasicBlockClass new.
	basicBlocks add: newBlock.
	currentBlock := newBlock.

	self chainPendingBlocksTo: newBlock.

	^ newBlock
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> newConditionalBlock: aFASTConditionalStatement [

	^(self newBasicBlock: FASTConditionalBasicBlock)
		statement: aFASTConditionalStatement;
		yourself
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> parentLoopBlocks [

	^ parentLoopBlocks
]

{ #category : 'accessing' }
FASTGenericCFGBuilder >> pendingNextBlock [

	^ pendingNextBlock
]

{ #category : 'removing' }
FASTGenericCFGBuilder >> removeLastPendingNextBlockAction [

	pendingNextBlock removeLast 
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> removePendingActionFor: aBlock [
	"pending action are pharo blocks with no clear link to the BasicBlock they modify
	 We use #copiedValueAt: to get this information from the pharo block
	 This is an ugly hack"

	pendingNextBlock copy do: [ :action |
		((action copiedValueAt: 1) = aBlock) 
		ifTrue: [pendingNextBlock remove: action]
	]
]

{ #category : 'basicBlocks' }
FASTGenericCFGBuilder >> runChainAction: settingAction with: aBasicBlock [

	settingAction value: aBasicBlock.
	pendingNextBlock remove: settingAction
]

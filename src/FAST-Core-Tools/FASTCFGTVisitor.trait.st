Trait {
	#name : 'FASTCFGTVisitor',
	#instVars : [
		'basicBlocks',
		'currentBlock',
		'pendingNextBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> addPendingNextBlockAction: settingAction [
	"settingAction is a pharo block with one argument (a BasicBlock) and is used to set the successor of another block
	 when we will know it
	 For not, sets the nextBlock to nil and register the settingAction for future use"

	settingAction value: nil.
	pendingNextBlock add: settingAction
]

{ #category : 'accessing' }
FASTCFGTVisitor >> basicBlocks [

	^basicBlocks ifNil: [ basicBlocks := OrderedCollection new ]
]

{ #category : 'accessing' }
FASTCFGTVisitor >> basicBlocks: anObject [

	basicBlocks := anObject
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> chainPendingBlocksTo: newBlock [

	self pendingNextBlock copy do: [ :settingAction |
		self runChainAction: settingAction with: newBlock ].

]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> closeCurrentBlock [

	currentBlock := nil
]

{ #category : 'accessing' }
FASTCFGTVisitor >> currentBlock [

	^ currentBlock
]

{ #category : 'accessing' }
FASTCFGTVisitor >> currentBlock: anObject [

	currentBlock := anObject
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlock and set it to currentBlock
	 typically called inside: `currentBlock nextBlock: (self newBasicBlock:)` to chain the new block
	 to the previous currentBlock"

	| newBlock |
	newBlock := aBasicBlockClass new.
	self basicBlocks add: newBlock.
	currentBlock := newBlock.

	self chainPendingBlocksTo: newBlock.

	^ newBlock
]

{ #category : 'accessing' }
FASTCFGTVisitor >> pendingNextBlock [

	^pendingNextBlock ifNil: [ pendingNextBlock := OrderedCollection new ]
]

{ #category : 'accessing' }
FASTCFGTVisitor >> pendingNextBlock: anObject [

	pendingNextBlock := anObject
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> removePendingActionFor: aBlock [
	"pending action are pharo blocks with no clear link to the BasicBlock they modify
	 We use #copiedValueAt: to get this information from the pharo block
	 This is an ugly hack"

	self pendingNextBlock copy do: [ :action |
		((action copiedValueAt: 1) = aBlock) 
		ifTrue: [ self pendingNextBlock remove: action ]
	]
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> runChainAction: settingAction with: aBasicBlock [

	settingAction value: aBasicBlock.
	self pendingNextBlock remove: settingAction

]

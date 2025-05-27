"
A Visitor trait that computes ControlFlowGraph on an AST

It is based on the algorithm to compute basic blocks from [https://en.wikipedia.org/wiki/Basic_block](https://en.wikipedia.org/wiki/Basic_block)

Instance variables:
- `basicBlocks` : collection of all blocks in the CFG
- `currentBlock` : being treated, new statements are added to it (unless they are conditional statements)
- `pendingNextBlock` : a collection of blocks that are waiting to know there nextBlock

## Pending next block

When creating a ConditionalBlock, its nextBlocks are not known immediately (eg. in a conditionalStatement, the next blocks are know later when the then-part and else-part are visited. Also, the nextBlock for the then-part and else-part are only known when visiting the statement following the conditionalStatement).

This instance variable contains **Pharo block(s)** to be execute when a new block is created and there is no `currentBlock` to link it to.

"
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
	"settingAction is a pharo block with one argument (a BasicBlock) and will be used to set the successor of another block
	 when we will know it
	 For now, sets the nextBlock to nil and register the settingAction for future use"

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

{ #category : 'visiting' }
FASTCFGTVisitor >> visitFASTTBinaryExpression: aFASTTBinaryExpression [
	"pruning the visit, no need to go inside expressions"

]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitFASTTLoopStatement: aFASTTLoopStatement [
	"basic blocks for a LOOP
	 - there must be some ConditionalBlock to enter or end the loop.
	   We assume it has already been created and is the currentBlock
	 - BasicBlock for the body of the loop
	 - another BasicBlock for after the LOOP"

	| conditionalBlock |

	conditionalBlock := self currentBlock.

	"loop body"
	self assert: self pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :bodyBlock |
		conditionalBlock nextBlock: bodyBlock onValue: true ].
	self closeCurrentBlock.
	aFASTTLoopStatement body accept: self.
	self chainPendingBlocksTo: conditionalBlock.

	"after loop"
	self assert: self pendingNextBlock isEmpty.
	self addPendingNextBlockAction: [ :afterBlock |
		conditionalBlock nextBlock: afterBlock onValue: false ].

	"parentLoopBlocks pop."
	self closeCurrentBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitFASTTStatement: aFASTTStatement [

	| newBlock |

	self currentBlock ifNil: [
		newBlock := self newBasicBlock: FASTCFGBasicBlock.
		self addPendingNextBlockAction: [ :nextBlock |
			newBlock nextBlock: nextBlock ] ].
	self currentBlock addStatement: aFASTTStatement

]

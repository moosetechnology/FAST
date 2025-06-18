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
		'branchValues',
		'pendingChainActions',
		'breakableStatementsStack'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGTVisitor >> basicBlocks [

	^basicBlocks ifNil: [ basicBlocks := OrderedCollection new ]
]

{ #category : 'accessing' }
FASTCFGTVisitor >> basicBlocks: anObject [

	basicBlocks := anObject
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> branchFor: aBranch predecessorBlock: predecessorBlock onValue: branchValue [
	"creates blocks for aBranch.
	 First of these blocks will be successor of predecessorBlock with the associated branchValue"

	self newValueAction: branchValue fromBlock: predecessorBlock.

	aBranch accept: self.

	self closeCurrentBlock
]

{ #category : 'accessing' }
FASTCFGTVisitor >> breakableStatementsStack [

	^breakableStatementsStack ifNil: [ breakableStatementsStack := Stack new ]
]

{ #category : 'private' }
FASTCFGTVisitor >> checkBreakableStatementEnd: aFASTStatement [
	"BreakableAction might have been deactivated so we re-activate it"

	aFASTStatement isBreakableStatement
		ifTrue: [ self popBreakableAction
			active: true ].
]

{ #category : 'private' }
FASTCFGTVisitor >> checkBreakableStatementStart: aFASTStatement fromBlock: predecessorBlock getNextBlock: aPharoBlock [

	aFASTStatement isBreakableStatement
		ifFalse: [ ^self ].

	self pushBreakableAction: (self newBreakActionFromBlock: predecessorBlock getNextBlock: aPharoBlock)

]

{ #category : 'private' }
FASTCFGTVisitor >> checkBreakableStatementStart: aFASTStatement getNextBlock: aPharoBlock [

	aFASTStatement isBreakableStatement
		ifFalse: [ ^self ].

	self pushBreakableAction: (self newBreakActionFromBlock: self currentBlock getNextBlock: aPharoBlock)

]

{ #category : 'actions' }
FASTCFGTVisitor >> closeActionForBlock: aBlock [

	self linkingActions do: [ :linkingAction |
		(linkingAction isActive and: [ linkingAction predecessorBlock = aBlock ])
			ifTrue: [ linkingAction active: false ]
	]
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> closeCurrentBlock [

	currentBlock := nil
]

{ #category : 'actions' }
FASTCFGTVisitor >> closePendingActions [

	self linkingActions do: [ :linkingAction |
		linkingAction isActive
			ifTrue: [ 
				linkingAction isGotoAction
					ifTrue: [ self basicBlocks do: [ :aBlock | linkingAction runWith: aBlock ] ]
					ifFalse: [ linkingAction runWith: FASTCFGNullBlock new ]
				 ]
	]
]

{ #category : 'accessing' }
FASTCFGTVisitor >> currentBlock [

	^ currentBlock
]

{ #category : 'accessing' }
FASTCFGTVisitor >> currentBlock: anObject [

	currentBlock := anObject
]

{ #category : 'actions' }
FASTCFGTVisitor >> disableActionsFromBlock: aBlock [

	pendingChainActions do: [ :action |
		(action predecessorBlock = aBlock)
			ifTrue: [ action active: false ]
	]
]

{ #category : 'private' }
FASTCFGTVisitor >> ensureBranchValuesForAllBranches: aFASTTBranchStatement [
	"ensures #branchValues is a collection from which we can remove elements (eg. not an array)
	 also make sure there is an edge value for all possible branches by creating default ones if
	   #branchValues is not long enough"

	| missingValues |

	branchValues :=  OrderedCollection withAll: branchValues.

	missingValues := (branchValues size + 1) to: (aFASTTBranchStatement branches size).

	branchValues addAll: (missingValues collect: [ :i | 'branch_' , i asString ])
]

{ #category : 'accessing' }
FASTCFGTVisitor >> linkingActions [

	^pendingChainActions ifNil: [ pendingChainActions := OrderedCollection new ]
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> newBasicBlock: aBasicBlockClass [
	"creates a new BasicBlock and set it to currentBlock
	 Chains the new block to any registered previous block in pendingChainActions"

	| newBlock |
	newBlock := aBasicBlockClass new.
	self basicBlocks add: newBlock.
	currentBlock := newBlock.

	self runPendingActionsWithSuccessor: newBlock.

	^ newBlock
]

{ #category : 'actions' }
FASTCFGTVisitor >> newBreakActionFromBlock: predecessorBlock getNextBlock: aPharoBlock [

	| action |
	action := FASTCFGBreakLinkingAction new
		predecessorBlock: predecessorBlock ;
		getNextBlock: aPharoBlock ;
		yourself.

	self linkingActions add: action.
	^action
]

{ #category : 'basicBlocks' }
FASTCFGTVisitor >> newConditionalBlock: aFASTFortranStatement [

	| newBlock |
	newBlock := self newBasicBlock: FASTCFGConditionalBasicBlock.
	newBlock statement: aFASTFortranStatement.
	self closeCurrentBlock.
	^newBlock
]

{ #category : 'actions' }
FASTCFGTVisitor >> newGotoAction: label fromBlock: predecessorBlock [

	| action |
	action := FASTCFGGotoLinkingAction new
		label: label ;
		predecessorBlock: predecessorBlock ;
		yourself.

	self linkingActions add: action.
	^action
]

{ #category : 'actions' }
FASTCFGTVisitor >> newUnconditionalActionFromBlock: predecessorBlock [

	| action |
	action := FASTCFGUnconditionalLinkingAction new
		predecessorBlock: predecessorBlock ;
		yourself.

	self linkingActions add: action.
	^action
]

{ #category : 'actions' }
FASTCFGTVisitor >> newValue: aValue action: decoratedAction [

	| valueAction |
	self linkingActions remove: decoratedAction.

	valueAction := FASTCFGValuedLinkingAction new
		value: aValue ;
		decoratedAction: decoratedAction ;
		yourself.

	self linkingActions add: valueAction.

	^valueAction
]

{ #category : 'actions' }
FASTCFGTVisitor >> newValueAction: aValue fromBlock: predecessorBlock [

	^self
		newValue: aValue
		action: (self newUnconditionalActionFromBlock: predecessorBlock)
]

{ #category : 'private' }
FASTCFGTVisitor >> nextBranchValue [

	^branchValues removeFirst 
]

{ #category : 'accessing' }
FASTCFGTVisitor >> popBreakableAction [

	self breakableStatementsStack
		ifEmpty: [ Error signal: 'BreakStatement outside a BreakableStatement' ].

	^self breakableStatementsStack pop
]

{ #category : 'accessing' }
FASTCFGTVisitor >> pushBreakableAction: aFASTStatement [

	self breakableStatementsStack push: aFASTStatement 
]

{ #category : 'actions' }
FASTCFGTVisitor >> runPendingActionsWithSuccessor: successorBlock [

	self linkingActions do: [ :linkingAction |
		linkingAction runWith: successorBlock ]
]

{ #category : 'accessing' }
FASTCFGTVisitor >> topBreakableAction [

	self breakableStatementsStack
		ifEmpty: [ Error signal: 'BreakStatement outside a BreakableStatement' ].

	^self breakableStatementsStack top
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTBehaviouralEntity: aFASTTBehaviouralEntity [

	aFASTTBehaviouralEntity statementBlock accept: self.

	self basicBlocks first isStart: true.
	self closePendingActions
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTBranchStatement: aFASTTBranchStatement [
	"BranchingStatement starts with an expression that selects what branch to execute
	   this becomes a conditionalBlock
	 Each branch should be associated with a value (for display in CFG)
	 nextBlock of each branch will be whatever comes after the branchingStatement"

	| conditionalBlock branchesPendingActions |
	self ensureBranchValuesForAllBranches: aFASTTBranchStatement.
	branchesPendingActions := OrderedCollection new.

	conditionalBlock := self newConditionalBlock: aFASTTBranchStatement.

	aFASTTBranchStatement branches do: [ :aBranch |
		aBranch ifNotNil: [
			self
				branchFor: aBranch
				predecessorBlock: conditionalBlock
				onValue: self nextBranchValue.

			branchesPendingActions addAll: self linkingActions.
			self linkingActions removeAll
		]
	].

	"put back all branches pendingNextBlocks for after this statement"
	self linkingActions addAll: (branchesPendingActions select: #isActive).

	^conditionalBlock 
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTBreakStatement: aFASTTBreakableStatement [
	"link it to the parent FASTTBreackableStatement and then close the currentblock"

	self visitFASTTStatement: aFASTTBreakableStatement.
	self closeActionForBlock: currentBlock.

	self topBreakableAction basicBlockToLink: currentBlock.

	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTConditionalStatement: aFASTTConditionalStatement [

	| conditionalBlock |
	branchValues := { true . false }.

	conditionalBlock := self visitFASTTBranchStatement: aFASTTConditionalStatement.

	aFASTTConditionalStatement falseBranch ifNil: [
		self
			newValueAction: false
			fromBlock: conditionalBlock
	]

]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTGotoStatement: aFASTTGotoStatement [
	"todo:
	 - end currentBlock (contains this statement)
	 - nextBlock of currentBlock is a block starting on the referred label (#gotoLabel)"

	self disableActionsFromBlock: currentBlock.
	self newGotoAction: aFASTTGotoStatement gotoLabel fromBlock: currentBlock.
	self closeCurrentBlock.
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTLoopStatement: aFASTTLoopStatement [
	"TLoopStatements are different from TBranchStatements in that the last block of the body
	 links back to the initial ConditionalStatement instead of to the block after the branchingStatement
	Note: LoopStatements are typically breakableStatements"

	| conditionalBlock |

	conditionalBlock := self newConditionalBlock: aFASTTLoopStatement.

	self
		checkBreakableStatementStart: aFASTTLoopStatement
		fromBlock: conditionalBlock 
		getNextBlock: [ :predecessorBlock | predecessorBlock nextBlockForValue: false ].

	"loop's body"
	self
		branchFor: aFASTTLoopStatement body
		predecessorBlock: conditionalBlock
		onValue: true.
	self runPendingActionsWithSuccessor: conditionalBlock.

	"after loop"
	self
		newValueAction: false
		fromBlock: conditionalBlock.
	self checkBreakableStatementEnd: aFASTTLoopStatement
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [
	"Ends the current basicBlock and has no nextBlock"

	self visitFASTTStatement: aFASTTReturnStatement.

	self runPendingActionsWithSuccessor: FASTCFGNullBlock new.

	self closeCurrentBlock
]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTStatement: aFASTTStatement [

	self currentBlock ifNil: [
		self newBasicBlock: FASTCFGBasicBlock.
		self newUnconditionalActionFromBlock: currentBlock.
	].
	self currentBlock addStatement: aFASTTStatement

]

{ #category : 'visiting - statements' }
FASTCFGTVisitor >> visitFASTTStatementBlock: aFASTTStatementBlock [

	aFASTTStatementBlock statements do: [ :statement |
		statement accept: self ]
]

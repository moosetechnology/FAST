"
I am a trait to provide everything needed in order to build a CFG graph from a FAST model.

## Requirements

One requirement is that my FAST model has a good visitor. It is recommanded to use the visitor generator of Famix in order to get one. For more info you can check this blog post: [https://modularmoose.org/blog/2026-05-20-improving-visitor-generator/](https://modularmoose.org/blog/2026-05-20-improving-visitor-generator/).

Another requirement is that the FAST model should use some FAST traits:
- `FASTTStatementBlock`: Used to know when to create normal blocks and to manage break and continue
- `FASTTStatement`: Used to know what statements to save in the blocks
- `FASTTBreakStatement` and `FASTTContinueStatement`: If the language supports break and continu in loops, they should use those traits
- `FASTTConditionalStatement`: This one is used to declare that a condition should be added to the statements to build a block 
- `FASTTReturnStatement`: This one is used to break the statement block containing it in case the language allows to have code after a return

Those are the most common and generic traits of FAST. But it is not possible with the current FAST to produce a generic CFG build. The user will need to use my API to implement the visit of nodes such as if statement, loops, swtich, try/catch, conditional expressions.

## Documentation

You can find the documentation on how the project works and how to implement your own CFG visitor here: [https://modularmoose.org/developers/fast-cfg/](https://modularmoose.org/developers/fast-cfg/)

## Tests

I have no test in this project because all my current features are tested via the tests of FAST-Python CFG implementation.
"
Trait {
	#name : 'FASTTCFGUtility',
	#instVars : [
		'startBlock',
		'currentStatements',
		'context'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'instance creation' }
FASTTCFGUtility classSide >> buildCFGOf: aFASTEntity [

	^ self new buildCFGOf: aFASTEntity
]

{ #category : 'running' }
FASTTCFGUtility >> addStatement: aStatement [

	^ currentStatements add: aStatement
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndPushBlockOfType: aClass [
	"I create a new block provided in parameter. It should be a conditional node.
	
	Ideally I should only be used by FASTTCFGUtility>>#buildAndUse:during: so that the context get poped when needed. But in some cases it get useful for me to be used alone. For example, when implementing the CFG of an elif since the false branch of the elif is the next elif or else of the parent if, and not a child of the elif."

	| block |
	block := self buildBlockOfType: aClass.
	context push: (FASTCFGContextEntry conditional: block).
	^ block
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUse: aClass during: aBlock [

	| conditional |
	conditional := self buildAndPushBlockOfType: aClass.

	aBlock cull: conditional.
	
	"Sometimes it is possible that we will need to pop multiple conditionals. 
	For example, in the case of elif. Usually the elif contains the `then` block but not the `else`. The else will be either the next elif, or next else or next block after the if.
	In that case, #buildNewConditional allows to push conditional blocks that I will clause with the containing conditional here. "
	[ conditional == self currentConditional ] whileFalse: [ context pop ].

	context pop.
	^ conditional
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseConditionalDuring: aBlock [

	^ self buildAndUse: FASTCFGConditionalBlock during: aBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseLoopDuring: aBlock [
	"For loops, we do an extra step compared to conditionals in order to build the loops if needed."

	self buildAndUseConditionalDuring: [ :loop |
			"In order to be able to manage the breaks correctly, we need to know if the conditional is a loop or not."
			loop isLoop: true.
			aBlock cull: loop.
			 ]
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseSwitchDuring: aBlock [

	^ self buildAndUse: FASTCFGSwitchBlock during: [ :switch |
			  aBlock cull: switch.
			  switch isFull: true ]
]

{ #category : 'running' }
FASTTCFGUtility >> buildAndUseTryDuring: aBlock [

	^ self buildAndUse: FASTCFGTryBlock during: [ :try |
			  aBlock cull: try.
			  try isFull ifFalse: [ try addPattern: nil ] ]
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockIfNeeded [
	"If we have statements stocked, we create a new block with them. Else we do nothing.
	
	If I should be call at the closing of a statement block in the AST visit, then you should call #endBlock instead."

	currentStatements ifEmpty: [ ^ self ].
	^ self buildBlockOfType: FASTCFGBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildBlockOfType: aBlockClass [
	"I'm responsible of creating nodes. I'll:
	- Build a block based on the class passed as parameter
	- Add the saved statements to it since we create a block once we visited all its statements
	- Set the previous blocks of this block
	- Add it on the top context blocks. This is useful to know that the following blocks of my statement block are not the first node of the statement block. This has an influence on the management of previous blocks."

	| newBlock |
	newBlock := aBlockClass new.
	newBlock statements: currentStatements.
	currentStatements := OrderedCollection new.

	self managePreviousBlocksOf: newBlock.

	context top addBlock: newBlock.

	^ newBlock
]

{ #category : 'running' }
FASTTCFGUtility >> buildCFGOf: aFASTEntryNode [

	context push: FASTCFGRootContextEntry new.
	aFASTEntryNode accept: self.
	self shouldBuildNullBlock ifTrue: [ self buildBlockOfType: FASTCFGNullBlock ].
	self assert: context size = 1.
	context pop.

	^ startBlock
]

{ #category : 'accessing' }
FASTTCFGUtility >> currentConditional [
	"I return the top conditional of the context stack. A conditional block can be one defining an if, elif, while, for, switch or a try."

	^ context top conditional
]

{ #category : 'running' }
FASTTCFGUtility >> endBlock [
	"I declare that we are ending the visit of a statement block. I'll build a new block with the current statements and then I'll flush the current blocks of the top context entry. In case we where visiting the true side of a conditional, this will mark the shift to the false side of the conditional."

	self buildBlockIfNeeded.
	
	"In case we are finishing the first block of a loop, we finilize the loop.
	In the past, this was done before popping loops from the context, but doing it here with this condition allows to easily manage the else clause of loops in Python."
	( context top isLoop and: [  self currentConditional nextBlocks size = 1 ]) ifTrue: [ self finializeLoop ].

	"We are changing of statement block so we flush the blocks we saved for the previous statement block."
	context top flushCurrentBlocks
]

{ #category : 'running' }
FASTTCFGUtility >> finializeLoop [
	"When we close a loop, we check all blocks that are not full and that do not end with a break of the current loop.
	
	I require that the loop to close is the top entry of the context"

	| allBreakingNodes |
	allBreakingNodes := self currentConditional allEffectiveBreakingBlocks.

	self currentConditional allFollowingBlocks
		reject: [ :block | block isFull or: [ allBreakingNodes includes: block ] ]
		thenDo: [ :block | block addNextBlock: self currentConditional ]
]

{ #category : 'initialization' }
FASTTCFGUtility >> initializeCFG [

	context := Stack new.
	currentStatements := OrderedCollection new
]

{ #category : 'running' }
FASTTCFGUtility >> managePreviousBlocksOf: newBlock [
	"If we are in a conditional, we add ourself there. Else we add ourself in all non finished conditionals and to their ."

	startBlock ifNil: [
			startBlock := newBlock.
			newBlock isStart: true.
			^ self ].

	context top currentBlocks ifEmpty: [  context top addNextBlock: newBlock ] ifNotEmpty: [ :blocksAtScope |
			(blocksAtScope flatCollectAsSet: #withAllFollowingBlocks)
				reject: [ :block | block isFull or: [ block shouldBreakOrContinueInContext: context ] ]
				thenDo: [ :block | block addNextBlock: newBlock ] ]
]

{ #category : 'asserting' }
FASTTCFGUtility >> shouldBuildNullBlock [
	"We build a null block if we have an unfinished conditional or more than one final block."

	| allBlocks |
	startBlock ifNil: [ ^ false ].
	
	allBlocks := startBlock withAllFollowingBlocks.

	(allBlocks select: [ :block | block isConditional and: [ block isFull not ] ]) ifNotEmpty: [ ^ true ].

	^ (allBlocks select: #isFinal) size > 1
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTBreakStatement: aBreakStatement [

	super visitFASTTBreakStatement: aBreakStatement.
	FASTCFGStatementBlockInterruption signal
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTConditionalStatement: aStatement [

	self addStatement: aStatement condition
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTContinueStatement: aBreakStatement [

	super visitFASTTContinueStatement: aBreakStatement.
	FASTCFGStatementBlockInterruption signal
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTReturnStatement: aTReturnStatement [

	super visitFASTTReturnStatement: aTReturnStatement.
	FASTCFGStatementBlockInterruption signal
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTStatement: aStatement [
	"Register the statement in the list of statements to create the current block once we find a conditional or the end of a block"

	self addStatement: aStatement
]

{ #category : 'visiting - generic' }
FASTTCFGUtility >> visitFASTTStatementBlock: aFASTTStatementBlock [
	"We do not consider the block as a statemert.
	Also, once we are done with a block, if we encountered statements we produce a new normal block with them."

	[ self visitCollection: aFASTTStatementBlock statements ]
		on: FASTCFGStatementBlockInterruption
		do: [ "End visit of the block and resume the rest of the visit." ].
	self endBlock
]

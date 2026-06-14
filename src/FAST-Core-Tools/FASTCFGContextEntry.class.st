"
I am a context entry used by `FASTCFGUtility` in order to keep a context of the FAST visit happening. 

Each time we enter a conditional, a new `FSTCFGAbstractConditionalBlock` subclass is created and added to the stack as an instance of myself. Once we finish to treat this conditional, we pop the top of the stack. 

In a context entry, on top of the conditional I am saving the current block created in the active branch of the conditional been visited. If a branch is finished, this collection of blocks should be flushed. 
This is needed because when we resolve the previous nodes of a node in `FASTTCFGUtility>>#managePreviousBlocksOf:`, if a block is the first of its branch, it should follow the conditional of the context entry. But if it is not, it should follow all unfinished blocks in the same statement block. Thus we need to save those blocks.
"
Class {
	#name : 'FASTCFGContextEntry',
	#superclass : 'Object',
	#instVars : [
		'conditional',
		'currentBlocks'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGContextEntry class >> conditional: aConditionalBlock [

	^ self new
		  conditional: aConditionalBlock;
		  yourself
]

{ #category : 'adding' }
FASTCFGContextEntry >> addBlock: aBlock [

	currentBlocks add: aBlock
]

{ #category : 'adding' }
FASTCFGContextEntry >> addNextBlock: aBlock [ 
	self conditional addNextBlock: aBlock
]

{ #category : 'accessing' }
FASTCFGContextEntry >> conditional [
	^ conditional
]

{ #category : 'accessing' }
FASTCFGContextEntry >> conditional: anObject [
	conditional := anObject
]

{ #category : 'accessing' }
FASTCFGContextEntry >> currentBlocks [
	"Reutrn the blocks that were already built in the current branch of the context entry I represent.
	
	At first it will be the blocks of the true branch. Once we close it once, it will be the blocks of the false branch.
	
	This is useful in order to know if a block we are creating is the first one of a branch or of it should follow already existing blocks.."

	^ currentBlocks
]

{ #category : 'accessing' }
FASTCFGContextEntry >> flushCurrentBlocks [

	currentBlocks := OrderedCollection new
]

{ #category : 'initialization' }
FASTCFGContextEntry >> initialize [

	super initialize.
	currentBlocks := OrderedCollection new
]

{ #category : 'accessing' }
FASTCFGContextEntry >> isLoop [

	^ self conditional
		  ifNil: [ false ]
		  ifNotNil: #isLoop
]

{ #category : 'printing' }
FASTCFGContextEntry >> printOn: aStream [

	super printOn: aStream.

	aStream nextPutAll: ' [ '.
	self conditional
		ifNil: [ aStream nextPutAll: 'No block' ]
		ifNotNil: [ self conditional printOn: aStream ].
	aStream nextPutAll: ' ]'
]

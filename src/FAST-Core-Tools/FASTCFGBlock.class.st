"
I am a block to represent a basic execution block in a CFG graph. 

A basic execution block is a block that does not end with a conditional and that have only one next block. 
"
Class {
	#name : 'FASTCFGBlock',
	#superclass : 'FASTCFGAbstractBlock',
	#instVars : [
		'nextBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'visiting' }
FASTCFGBlock >> accept: aVisitor [

	^ aVisitor visitCFGBlock: self
]

{ #category : 'adding' }
FASTCFGBlock >> addNextBlock: aBlock [

	self nextBlock ifNotNil: [ self error: 'This basic block already has a next block and cannot have multiple.' ].
	aBlock addPreviousBlock: self.
	^ self nextBlock: aBlock
]

{ #category : 'private' }
FASTCFGBlock >> endsWithBreakStatement [

	^ self statements last isBreakStatement
]

{ #category : 'private' }
FASTCFGBlock >> endsWithContinueStatement [

	^ self statements last isContinueStatement
]

{ #category : 'testing' }
FASTCFGBlock >> isFull [

	^ self nextBlock isNotNil
]

{ #category : 'mermaid' }
FASTCFGBlock >> mermaidDelimiters [

	^ '(' -> ')'
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlock [
	^ nextBlock
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlock: anObject [
	nextBlock := anObject
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlockForValues [

	^ self nextBlock
		  ifNil: [ Array empty ]
		  ifNotNil: [ { ('' -> self nextBlock) } ]
]

{ #category : 'accessing' }
FASTCFGBlock >> nextBlocks [

	^ self nextBlock
		  ifNil: [ Array empty ]
		  ifNotNil: [ { self nextBlock } ]
]

{ #category : 'printing' }
FASTCFGBlock >> printOn: aStream [

	super printOn: aStream.
	
	"Printing the condition since it is the most important part of the block"
	self statements ifNotEmpty: [
			aStream
				nextPutAll: ' [ ';
				nextPutAll: self statements first sourceCode.

			self statements size > 1 ifTrue: [ aStream nextPutAll: ' ... ' ].
			aStream nextPutAll: ' ]' ]
]

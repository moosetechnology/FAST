"
A ""normal"" basic block in the CFG

it contains a list of statement (without branching) and have a successor block (#nextBlock)
"
Class {
	#name : 'FASTCFGBasicBlock',
	#superclass : 'FASTCFGAbstractBasicBlock',
	#instVars : [
		'nextBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGBasicBlock >> nextBlock [

	^ nextBlock
]

{ #category : 'accessing' }
FASTCFGBasicBlock >> nextBlock: aBlock [
	"puts aBlock in receiver's #nextBlock unless it already contains a NullBlock"

	(nextBlock isNotNil and: [ nextBlock isNullBlock ])
		ifTrue: [ ^self ].
	
	nextBlock := aBlock
]

{ #category : 'accessing' }
FASTCFGBasicBlock >> nextBlockForValues [

	^{ #next -> self nextBlock }
]

{ #category : 'accessing' }
FASTCFGBasicBlock >> nextBlocks [

	^nextBlock
		ifNil: [ #() ]
		ifNotNil: [ { nextBlock } ]
]

{ #category : 'printing' }
FASTCFGBasicBlock >> sourceCode [

	^String cr join: (self statements collect: #exportForCFG)
]

"
A ""normal"" basic block in the CFG

it contains a list of statement (without branching) and have a successor block (#nextBlock)
"
Class {
	#name : 'FASTBasicBlock',
	#superclass : 'FASTAbstractBasicBlock',
	#instVars : [
		'nextBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTBasicBlock >> nextBlock [

	^ nextBlock
]

{ #category : 'accessing' }
FASTBasicBlock >> nextBlock: anObject [
	"puts aBlock in #nextBlock unless it already contains aNullBlock"
	(nextBlock isNotNil and: [ nextBlock isNullBlock ])
	ifTrue: [ ^self ].

	nextBlock := anObject
]

{ #category : 'accessing' }
FASTBasicBlock >> nextBlockForValues [

	^{ #next -> self nextBlock }
]

{ #category : 'accessing' }
FASTBasicBlock >> nextBlocks [

	^nextBlock
		ifNil: [ #() ]
		ifNotNil: [ { nextBlock } ]
]

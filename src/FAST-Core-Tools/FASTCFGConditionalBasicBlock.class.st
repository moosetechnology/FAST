"
A conditional or branching block in the CFG

It contains one statement which is a conditional or branching statement

It has several successors, each associated to a value
For example an if-statement will be represented has a ConditionalBasicBlock and will have two succesors associated respectively to the `true` and `false` values
"
Class {
	#name : 'FASTCFGConditionalBasicBlock',
	#superclass : 'FASTCFGAbstractBasicBlock',
	#instVars : [
		'nextBlocks'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> addStatement: aStatement [

	self isEmpty ifFalse: [ AssertionFailure signal: 'ConditionalBasicBlocks can have only one statement' ].

	super addStatement: aStatement
]

{ #category : 'initialization' }
FASTCFGConditionalBasicBlock >> initialize [

	super initialize.

	nextBlocks := Dictionary new: 2
]

{ #category : 'testing' }
FASTCFGConditionalBasicBlock >> isConditional [

	^true
]

{ #category : 'testing' }
FASTCFGConditionalBasicBlock >> isFinal [

	super isFinal ifTrue: [ ^true ].
	nextBlocks valuesDo: [ :nextBlock | nextBlock ifNil: [ ^true ] ].
	^false
]

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> nextBlock: aBlock onValue: aValue [
	"if the receiver's nextBlock for aValue is not a NullBlock, then set it to aBlock, otherwise leave the NullBlock"

	nextBlocks at: aValue asString ifPresent: [ :currentNext |
		currentNext isNullBlock ifTrue: [ ^self ]
	].

	nextBlocks at: aValue asString put: aBlock
]

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> nextBlockForValue: aValue [

	^nextBlocks at: aValue ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> nextBlockForValues [

	^nextBlocks associations
]

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> nextBlocks [

	^nextBlocks values
]

{ #category : 'printing' }
FASTCFGConditionalBasicBlock >> sourceCode [

	^self firstStatement exportForCFG
]

{ #category : 'accessing' }
FASTCFGConditionalBasicBlock >> statement: aFASTFortranStatement [

	self addStatement: aFASTFortranStatement 
]

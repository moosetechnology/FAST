"
A conditional or branching block in the CFG

It contains one statement which is a conditional or branching statement

It has several successors, each associated to a value
For example an if-statement will be represented has a ConditionalBasicBlock and will have two succesors associated respectively to the `true` and `false` values
"
Class {
	#name : 'FASTConditionalBasicBlock',
	#superclass : 'FASTAbstractBasicBlock',
	#instVars : [
		'nextBlocks'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTConditionalBasicBlock >> addStatement: aStatement [

	self isEmpty ifFalse: [ AssertionFailure signal: 'ConditionalBasicBlocks can have only one statement' ].

	super addStatement: aStatement
]

{ #category : 'initialization' }
FASTConditionalBasicBlock >> initialize [

	super initialize.

	nextBlocks := Dictionary new: 2
]

{ #category : 'initialization' }
FASTConditionalBasicBlock >> isConditional [

	^true
]

{ #category : 'initialization' }
FASTConditionalBasicBlock >> isFinal [

	super isFinal ifTrue: [ ^true ].
	nextBlocks valuesDo: [ :nextBlock | nextBlock ifNil: [ ^true ] ].
	^false
]

{ #category : 'accessing' }
FASTConditionalBasicBlock >> nextBlock: aBlock onValue: aValue [
	"if the next block for aValue is not a NullBlock, then set it to aBlock, otherwise leave the NullBlock"
	| currentNext |

	currentNext := nextBlocks at: aValue ifAbsent: [ self ].
	currentNext ifNil: [ currentNext := self ].

	currentNext isNullBlock ifTrue: [ ^self ].

	nextBlocks at: aValue put: aBlock
]

{ #category : 'accessing' }
FASTConditionalBasicBlock >> nextBlockForValue: aValue [

	^nextBlocks at: aValue ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTConditionalBasicBlock >> nextBlockForValues [

	^nextBlocks associations
]

{ #category : 'accessing' }
FASTConditionalBasicBlock >> nextBlocks [

	^nextBlocks values
]

{ #category : 'printing' }
FASTConditionalBasicBlock >> sourceCode [

	^self firstStatement exportForCFG
]

{ #category : 'printing' }
FASTConditionalBasicBlock >> statement: aFASTFortranStatement [

	self addStatement: aFASTFortranStatement 
]

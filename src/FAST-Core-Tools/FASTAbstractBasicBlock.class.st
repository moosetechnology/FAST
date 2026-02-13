"
Represent a block in the control flow graph

a block has
- #statements in a FAST ast that it contains
- properties
  - #start: for starting block in the CFG
  - #final for final blocks in the CFG
- #nextBlocks that come after it in the CFG
"
Class {
	#name : 'FASTAbstractBasicBlock',
	#superclass : 'Object',
	#instVars : [
		'isStart',
		'statements'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTAbstractBasicBlock >> addStatement: aFASTStatement [

	self statements add: aFASTStatement
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> firstStatement [

	^self isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ self statements first ]
]

{ #category : 'initialization' }
FASTAbstractBasicBlock >> initialize [

	super initialize.

	isStart := false.
	statements := OrderedCollection new
]

{ #category : 'initialization' }
FASTAbstractBasicBlock >> isConditional [

	^false
]

{ #category : 'testing' }
FASTAbstractBasicBlock >> isEmpty [

	^self statements isEmpty
]

{ #category : 'initialization' }
FASTAbstractBasicBlock >> isFinal [
	"The block last statement is also the last executed one in the CFG"

	^(self nextBlocks isEmpty) or:
	[ self nextBlocks anySatisfy: [ :block | block isNil or: [ block isNullBlock]] ]
]

{ #category : 'testing' }
FASTAbstractBasicBlock >> isNullBlock [

	^false
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> isStart [

	^ isStart
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> isStart: anObject [

	isStart := anObject
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> lastStatement [

	^ self statements last
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> nextBlocks [

	self subclassResponsibility
]

{ #category : 'printing' }
FASTAbstractBasicBlock >> sourceCode [

	self subclassResponsibility 
]

{ #category : 'accessing' }
FASTAbstractBasicBlock >> statements [

	^ statements
]

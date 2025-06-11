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
	#name : 'FASTCFGAbstractBasicBlock',
	#superclass : 'Object',
	#instVars : [
		'isStart',
		'statements'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> addStatement: aFASTStatement [

	self statements add: aFASTStatement
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> firstStatement [

	^self isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ self statements first ]
]

{ #category : 'initialization' }
FASTCFGAbstractBasicBlock >> initialize [

	super initialize.

	isStart := false.
	statements := OrderedCollection new
]

{ #category : 'testing' }
FASTCFGAbstractBasicBlock >> isConditional [

	^false
]

{ #category : 'testing' }
FASTCFGAbstractBasicBlock >> isEmpty [

	^self statements isEmpty
]

{ #category : 'testing' }
FASTCFGAbstractBasicBlock >> isFinal [
	"The block last statement is also the last executed one in the CFG"

	^(self nextBlocks isEmpty) or:
	[ self nextBlocks anySatisfy: [ :block | block isNil or: [ block isNullBlock]] ]
]

{ #category : 'testing' }
FASTCFGAbstractBasicBlock >> isNullBlock [

	^false
]

{ #category : 'testing' }
FASTCFGAbstractBasicBlock >> isStart [

	^isStart
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> isStart: anObject [

	isStart := anObject
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> label [

	^self firstStatement
		ifNil: [ nil ]
		ifNotNil: [ :statement | statement label ]
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> lastStatement [

	^self statements
		ifEmpty: [ nil ]
		ifNotEmpty: [ :stmts | stmts last]
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> nextBlocks [

	self subclassResponsibility
]

{ #category : 'printing' }
FASTCFGAbstractBasicBlock >> sourceCode [

	self subclassResponsibility 
]

{ #category : 'accessing' }
FASTCFGAbstractBasicBlock >> statements [

	^statements
]

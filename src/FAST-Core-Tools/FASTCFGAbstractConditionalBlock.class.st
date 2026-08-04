"
I am an abstract class to represent conditional blocks. 

A conditional block is a block that will have multiple next blocks and not only one. In general the last statement of the block is the condition that triggered the split.

A conditional also knows its merge block. The merge block is the first block present in all branches of the conditional. This means that it is the first block right after the conditional block
"
Class {
	#name : 'FASTCFGAbstractConditionalBlock',
	#superclass : 'FASTCFGAbstractBlock',
	#instVars : [
		'mergeBlock'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGAbstractConditionalBlock class >> isAbstract [

	^ self = FASTCFGAbstractConditionalBlock
]

{ #category : 'private' }
FASTCFGAbstractConditionalBlock >> endsWithBreakStatement [
	"I return true if I have my two next blocks and they both end with a break statement."

	^ self isFull and: [ self nextBlocks allSatisfy: #endsWithBreakStatement ]
]

{ #category : 'private' }
FASTCFGAbstractConditionalBlock >> endsWithContinueStatement [
	"I return true if I have my two next blocks and they both end with a break statement."

	^ self isFull and: [ self nextBlocks allSatisfy: #endsWithContinueStatement ]
]

{ #category : 'testing' }
FASTCFGAbstractConditionalBlock >> isConditional [

	^ true
]

{ #category : 'accessing' }
FASTCFGAbstractConditionalBlock >> mergeBlock [
	^ mergeBlock
]

{ #category : 'accessing' }
FASTCFGAbstractConditionalBlock >> mergeBlock: anObject [
	mergeBlock := anObject
]

{ #category : 'printing' }
FASTCFGAbstractConditionalBlock >> printOn: aStream [

	super printOn: aStream.
	
	"Printing the condition since it is the most important part of the block"
	self statements ifNotEmpty: [
			aStream nextPutAll: ' [ '.

			self statements size > 1 ifTrue: [ aStream nextPutAll: ' ... ' ].
			aStream
				nextPutAll: self statements last sourceCode;
				nextPutAll: ' ]' ]
]

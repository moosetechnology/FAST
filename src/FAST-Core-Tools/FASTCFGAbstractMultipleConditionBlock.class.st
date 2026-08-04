"
I am an abstract class to represent conditional blocks with multiple exits (0 to n). 

This will be used to define blocks for switch or try catch.

I keep an ordered dictionary for the next blocks association the pattern determining the next block condition and the block executed if the pattern matches. 

In case the pattern is nil, it means that we have the default block (for example: a default case in a switch or a finally block in a try catch).


"
Class {
	#name : 'FASTCFGAbstractMultipleConditionBlock',
	#superclass : 'FASTCFGAbstractConditionalBlock',
	#instVars : [
		'blocksMap'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGAbstractMultipleConditionBlock class >> isAbstract [

	^ self == FASTCFGAbstractMultipleConditionBlock
]

{ #category : 'adding' }
FASTCFGAbstractMultipleConditionBlock >> addNextBlock: aBlock [
	"The way I work, we should have created a new entry with the pattern of the switch in my dictionary earlier. 
	I'll add the node in this pattern that should be associated to nil."

	| lastAssociation |
	lastAssociation := blocksMap associations last.
	self assert: lastAssociation value isNil description: 'My last pattern should be associated to nil since it should not have a value yet.'.

	aBlock addPreviousBlock: self.
	^ blocksMap at: lastAssociation key put: aBlock
]

{ #category : 'adding' }
FASTCFGAbstractMultipleConditionBlock >> addPattern: aFASTNode [
	"We add a pattern and then the value will be set in #addNextBlock."

	blocksMap at: aFASTNode put: nil
]

{ #category : 'initialization' }
FASTCFGAbstractMultipleConditionBlock >> initialize [

	super initialize.
	blocksMap := OrderedDictionary new
]

{ #category : 'accessing' }
FASTCFGAbstractMultipleConditionBlock >> nextBlockForValues [

	^ blocksMap associations
]

{ #category : 'accessing' }
FASTCFGAbstractMultipleConditionBlock >> nextBlocks [

	^ blocksMap values
]

{ #category : 'accessing' }
FASTCFGAbstractMultipleConditionBlock >> patterns [
	^ blocksMap keys
]

{ #category : 'accessing' }
FASTCFGAbstractMultipleConditionBlock >> patternsAndBlocks [

	^ self nextBlockForValues
]

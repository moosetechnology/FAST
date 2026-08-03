"
I am a trait to introduce the capability to visit a Control Flow Graph. 

The visitor using me also need to use a visitor for the language of the CFG. For example, for Python, the visitor will need to use me and FASTTPythonVisitor. 

In case of loops, I'll visit the next blocks only once.
"
Trait {
	#name : 'FASTCFGTVisitor',
	#instVars : [
		'visitedBlocks'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'visiting' }
FASTCFGTVisitor >> visit: aCFGBlockOrFASTEntity [

	(self visitedBlocks includes: aCFGBlockOrFASTEntity) ifTrue: [ ^ self ]. "Breaking the visit if it was already visited"
	^ aCFGBlockOrFASTEntity ifNotNil: [ aCFGBlockOrFASTEntity accept: self ]
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGAbstractBlock: aBlock [
	"Any block visit their statements and next block if this was not done already (this can happen with loop blocks)."

	self visitedBlocks add: aBlock.
	aBlock statements do: [ :statement | statement accept: self ]
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGAbstractConditionalBlock: aBlock [

	self visitCFGAbstractBlock: aBlock.

	self flag: #todo. "We should change the order of the visit to visit all the blocks of the conditional before the ones after the conditional."
	aBlock nextBlocks do: [ :block | self visit: block ]
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGAbstractMultipleConditionalBlock: aBlock [

	aBlock patterns do: [ :pattern |
			pattern isCollection
				ifTrue: [ pattern do: [ :statement | statement accept: self ] ]
				ifFalse: [ pattern accept: self ] ].

	self visitCFGAbstractConditionalBlock: aBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGBlock: aBlock [

	self visitCFGAbstractBlock: aBlock.

	self visit: aBlock nextBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGConditionalBlock: aBlock [

	self visitCFGAbstractConditionalBlock: aBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGNullBlock: aBlock [

	self visitCFGAbstractBlock: aBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGSwitchBlock: aBlock [

	self visitCFGAbstractMultipleConditionalBlock: aBlock
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGTryBlock: aBlock [

	self visitCFGAbstractMultipleConditionalBlock: aBlock
]

{ #category : 'accessing' }
FASTCFGTVisitor >> visitedBlocks [

	^ visitedBlocks ifNil: [ visitedBlocks := IdentitySet new ]
]

"
I am a trait to introduce the capability to visit a Control Flow Graph. 

The visitor using me also need to use a visitor for the language of the CFG. For example, for Python, the visitor will need to use me and FASTTPythonVisitor. 
"
Trait {
	#name : 'FASTCFGTVisitor',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'visiting' }
FASTCFGTVisitor >> visit: aCFGBlockOrFASTEntity [

	^ aCFGBlockOrFASTEntity ifNotNil: [ aCFGBlockOrFASTEntity accept: self ]
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGAbstractBlock: aBlock [
	"Any block visit their statements."

	aBlock statements do: [ :statement | statement accept: self ].
	aBlock nextBlocks do: [ :bloc | bloc accept: self ]
]

{ #category : 'visiting' }
FASTCFGTVisitor >> visitCFGAbstractConditionalBlock: aBlock [

	self visitCFGAbstractBlock: aBlock
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

	self visitCFGAbstractBlock: aBlock
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

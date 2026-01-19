"
A ""virtual"" block representing a forced end of the control flow.

NullBlock are not added in the list of blocks of the CFG, they appear only as #nextBlock of a final block
"
Class {
	#name : 'FASTNullBlock',
	#superclass : 'FASTAbstractBasicBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTNullBlock >> isEmpty [

	^false
]

{ #category : 'testing' }
FASTNullBlock >> isFinal [

	^false
]

{ #category : 'testing' }
FASTNullBlock >> isNullBlock [

	^true
]

{ #category : 'testing' }
FASTNullBlock >> nextBlocks [

	^#()
]

{ #category : 'testing' }
FASTNullBlock >> sourceCode [

	^''
]

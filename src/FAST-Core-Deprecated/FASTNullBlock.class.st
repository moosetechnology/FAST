"
A ""virtual"" block representing a forced end of the control flow.

NullBlock are not added in the list of blocks of the CFG, they appear only as #nextBlock of a final block
"
Class {
	#name : 'FASTNullBlock',
	#superclass : 'FASTAbstractBasicBlock',
	#category : 'FAST-Core-Deprecated',
	#package : 'FAST-Core-Deprecated'
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

"
A ""virtual"" block representing a forced end of the control flow.

NullBlock are not added in the list of blocks of the CFG, they appear only as #nextBlock of a final block
"
Class {
	#name : 'FASTCFGNullBlock',
	#superclass : 'FASTCFGAbstractBasicBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGNullBlock >> isEmpty [

	^false
]

{ #category : 'testing' }
FASTCFGNullBlock >> isFinal [

	^false
]

{ #category : 'testing' }
FASTCFGNullBlock >> isNullBlock [

	^true
]

{ #category : 'testing' }
FASTCFGNullBlock >> isStart [ 

	^false
]

{ #category : 'accessing' }
FASTCFGNullBlock >> nextBlocks [

	^#()
]

{ #category : 'printing' }
FASTCFGNullBlock >> sourceCode [

	^''
]

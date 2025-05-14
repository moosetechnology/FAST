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

{ #category : 'accessing' }
FASTCFGNullBlock >> nextBlocks [

	^#()
]

{ #category : 'printing' }
FASTCFGNullBlock >> sourceCode [

	^''
]

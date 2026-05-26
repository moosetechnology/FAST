Class {
	#name : 'FASTTryBasicBlock',
	#superclass : 'FASTConditionalBasicBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTTryBasicBlock >> addStatement: aFASTStatement [

	self statements add: aFASTStatement
]

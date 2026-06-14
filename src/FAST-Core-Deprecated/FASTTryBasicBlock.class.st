Class {
	#name : 'FASTTryBasicBlock',
	#superclass : 'FASTConditionalBasicBlock',
	#category : 'FAST-Core-Deprecated',
	#package : 'FAST-Core-Deprecated'
}

{ #category : 'adding' }
FASTTryBasicBlock >> addStatement: aFASTStatement [

	self statements add: aFASTStatement
]

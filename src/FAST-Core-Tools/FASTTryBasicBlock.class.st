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

{ #category : 'printing' }
FASTTryBasicBlock >> sourceCode [

	| exporter |
	exporter := self firstStatement exporterForCFG.
	^ String streamContents: [ :s |
		  self statements do: [ :stmt |
			  s nextPutAll: (exporter export: stmt) ] ]
]

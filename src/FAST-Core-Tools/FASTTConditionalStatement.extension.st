Extension { #name : 'FASTTConditionalStatement' }

{ #category : '*FAST-Core-Tools' }
FASTTConditionalStatement >> exportForCFG [

	^'IF: ' , self condition exportForCFG
]

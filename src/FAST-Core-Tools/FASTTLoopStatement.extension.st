Extension { #name : 'FASTTLoopStatement' }

{ #category : '*FAST-Core-Tools' }
FASTTLoopStatement >> exportForCFG [

	^'LOOP: ' , self expression exportForCFG
]

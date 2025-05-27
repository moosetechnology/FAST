Extension { #name : 'FASTTLoopStatement' }

{ #category : '*FAST-Core-Visitor' }
FASTTLoopStatement >> accept: aVisitor [
	^ aVisitor visitFASTTLoopStatement: self
]

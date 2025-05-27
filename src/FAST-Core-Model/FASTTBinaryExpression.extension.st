Extension { #name : 'FASTTBinaryExpression' }

{ #category : '*FAST-Core-Visitor' }
FASTTBinaryExpression >> accept: aVisitor [
	^ aVisitor visitFASTTBinaryExpression: self
]

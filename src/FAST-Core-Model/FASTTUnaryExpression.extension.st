Extension { #name : 'FASTTUnaryExpression' }

{ #category : '*FAST-Core-Visitor' }
FASTTUnaryExpression >> accept: aVisitor [
	^ aVisitor visitFASTTUnaryExpression: self
]

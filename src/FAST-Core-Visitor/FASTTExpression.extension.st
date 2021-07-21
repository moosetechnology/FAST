Extension { #name : #FASTTExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTTExpression >> accept: aVisitor [
	^ aVisitor visitFASTTExpression: self
]

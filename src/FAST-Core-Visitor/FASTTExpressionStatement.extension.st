Extension { #name : #FASTTExpressionStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTExpressionStatement >> accept: aVisitor [
	^ aVisitor visitFASTTExpressionStatement: self
]

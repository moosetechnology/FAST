Extension { #name : #FASTTReturnStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTReturnStatement >> accept: aVisitor [
	^ aVisitor visitFASTTReturnStatement: self
]

Extension { #name : #FASTTStatementBlock }

{ #category : #'*FAST-Core-Visitor' }
FASTTStatementBlock >> accept: aVisitor [
	^ aVisitor visitFASTTStatementBlock: self
]

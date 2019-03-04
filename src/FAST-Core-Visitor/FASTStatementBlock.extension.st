Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Core-Visitor' }
FASTStatementBlock >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTStatementBlock: self
]

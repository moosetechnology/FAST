Extension { #name : #FASTTStatementBlock }

{ #category : #'*FAST-Core-Visitor' }
FASTTStatementBlock >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTStatementBlock: self
]

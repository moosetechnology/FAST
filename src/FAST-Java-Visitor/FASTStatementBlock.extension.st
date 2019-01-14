Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTStatementBlock >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTStatementBlock: self
]

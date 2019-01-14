Extension { #name : #FASTStringLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTStringLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTStringLiteral: self
]

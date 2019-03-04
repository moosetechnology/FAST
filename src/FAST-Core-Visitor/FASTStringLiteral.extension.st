Extension { #name : #FASTStringLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTStringLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTStringLiteral: self
]

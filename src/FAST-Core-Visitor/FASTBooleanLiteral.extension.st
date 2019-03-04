Extension { #name : #FASTBooleanLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTBooleanLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTBooleanLiteral: self
]

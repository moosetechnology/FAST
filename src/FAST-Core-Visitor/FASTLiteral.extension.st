Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTLiteral: self
]

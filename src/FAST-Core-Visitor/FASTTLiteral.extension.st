Extension { #name : #FASTTLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTLiteral: self
]

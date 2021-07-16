Extension { #name : #FASTTLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTLiteral: self
]

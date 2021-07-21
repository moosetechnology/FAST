Extension { #name : #FASTTStringLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTStringLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTStringLiteral: self
]

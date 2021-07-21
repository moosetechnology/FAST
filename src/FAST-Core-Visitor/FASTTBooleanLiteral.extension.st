Extension { #name : #FASTTBooleanLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTBooleanLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTBooleanLiteral: self
]

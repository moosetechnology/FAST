Extension { #name : #FASTTNumericalLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTNumericalLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTNumericalLiteral: self
]

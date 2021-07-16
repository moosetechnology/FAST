Extension { #name : #FASTTNumericalLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTNumericalLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTNumericalLiteral: self
]

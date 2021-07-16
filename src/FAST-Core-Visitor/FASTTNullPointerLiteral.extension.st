Extension { #name : #FASTTNullPointerLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTNullPointerLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTNullPointerLiteral: self
]

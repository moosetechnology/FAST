Extension { #name : #FASTNullPointerLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTNullPointerLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTNullPointerLiteral: self
]

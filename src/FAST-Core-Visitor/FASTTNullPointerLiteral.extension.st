Extension { #name : #FASTTNullPointerLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTNullPointerLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTNullPointerLiteral: self
]

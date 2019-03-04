Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTJavaCharacterLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCharacterLiteral: self
]

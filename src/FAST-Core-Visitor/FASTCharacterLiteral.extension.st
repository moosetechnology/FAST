Extension { #name : #FASTCharacterLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTCharacterLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTCharacterLiteral: self
]

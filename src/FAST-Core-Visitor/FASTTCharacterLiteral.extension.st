Extension { #name : #FASTTCharacterLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTCharacterLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitCharacterLiteralNode: self
]

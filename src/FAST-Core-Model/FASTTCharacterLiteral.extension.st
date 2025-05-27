Extension { #name : 'FASTTCharacterLiteral' }

{ #category : '*FAST-Core-Visitor' }
FASTTCharacterLiteral >> accept: aVisitor [
	^ aVisitor visitFASTTCharacterLiteral: self
]

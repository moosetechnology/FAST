Extension { #name : #FASTTCharacterLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTCharacterLiteral >> accept: aVisitor [
	^ aVisitor visitCharacterLiteralNode: self
]

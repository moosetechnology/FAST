Extension { #name : #FASTCharacterLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTCharacterLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTCharacterLiteral: self
]

Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCharacterLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaCharacterLiteral: self
]

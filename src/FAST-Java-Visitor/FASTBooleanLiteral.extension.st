Extension { #name : #FASTBooleanLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTBooleanLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTBooleanLiteral: self
]

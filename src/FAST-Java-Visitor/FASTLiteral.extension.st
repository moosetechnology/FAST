Extension { #name : #FASTLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTLiteral: self
]

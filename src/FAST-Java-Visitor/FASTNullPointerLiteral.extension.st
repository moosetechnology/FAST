Extension { #name : #FASTNullPointerLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTNullPointerLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTNullPointerLiteral: self
]

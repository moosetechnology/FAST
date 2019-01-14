Extension { #name : #FASTJavaIntegerLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIntegerLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaIntegerLiteral: self
]

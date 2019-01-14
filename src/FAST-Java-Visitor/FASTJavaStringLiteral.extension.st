Extension { #name : #FASTJavaStringLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaStringLiteral >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaStringLiteral: self
]

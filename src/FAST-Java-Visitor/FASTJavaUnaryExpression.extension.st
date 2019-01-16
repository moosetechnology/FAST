Extension { #name : #FASTJavaUnaryExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaUnaryExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaUnaryExpression: self
]

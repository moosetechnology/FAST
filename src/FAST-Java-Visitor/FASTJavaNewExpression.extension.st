Extension { #name : #FASTJavaNewExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaNewExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewExpression: self
]

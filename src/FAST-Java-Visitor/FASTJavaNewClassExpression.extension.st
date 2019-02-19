Extension { #name : #FASTJavaNewClassExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaNewClassExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewClassExpression: self
]

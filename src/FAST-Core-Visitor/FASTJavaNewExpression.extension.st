Extension { #name : #FASTJavaNewExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTJavaNewExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaNewExpression: self
]

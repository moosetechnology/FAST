Extension { #name : #FASTExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTExpression: self
]

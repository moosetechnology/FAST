Extension { #name : #FASTTExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTTExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTExpression: self
]

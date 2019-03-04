Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTVariableExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTVariableExpression: self
]

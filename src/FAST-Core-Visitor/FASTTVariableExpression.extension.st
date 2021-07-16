Extension { #name : #FASTTVariableExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTTVariableExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTVariableExpression: self
]

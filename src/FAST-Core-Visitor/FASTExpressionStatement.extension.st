Extension { #name : #FASTExpressionStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTExpressionStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTExpressionStatement: self
]

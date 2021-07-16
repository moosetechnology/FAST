Extension { #name : #FASTTExpressionStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTExpressionStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTExpressionStatement: self
]

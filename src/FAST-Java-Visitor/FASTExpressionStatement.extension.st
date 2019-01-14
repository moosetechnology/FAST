Extension { #name : #FASTExpressionStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTExpressionStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTExpressionStatement: self
]

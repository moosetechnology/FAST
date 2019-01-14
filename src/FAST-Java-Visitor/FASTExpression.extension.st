Extension { #name : #FASTExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTExpression: self
]

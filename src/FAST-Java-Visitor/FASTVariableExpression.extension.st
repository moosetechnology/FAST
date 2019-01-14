Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTVariableExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTVariableExpression: self
]

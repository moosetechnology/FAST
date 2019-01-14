Extension { #name : #FASTJavaAssignementExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaAssignementExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaAssignementExpression: self
]

Extension { #name : #FASTTAssignment }

{ #category : #'*FAST-Core-Visitor' }
FASTTAssignment >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTExpression: self
]

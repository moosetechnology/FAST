Extension { #name : #FASTTAssignment }

{ #category : #'*FAST-Core-Visitor' }
FASTTAssignment >> accept: aVisitor [
	^ aVisitor visitFASTTExpression: self
]

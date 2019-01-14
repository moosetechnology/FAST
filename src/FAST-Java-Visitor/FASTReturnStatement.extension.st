Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTReturnStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTReturnStatement: self
]

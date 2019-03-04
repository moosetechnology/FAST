Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTReturnStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTReturnStatement: self
]

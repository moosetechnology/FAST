Extension { #name : #FASTTReturnStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTReturnStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTReturnStatement: self
]

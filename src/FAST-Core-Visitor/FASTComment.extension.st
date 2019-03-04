Extension { #name : #FASTComment }

{ #category : #'*FAST-Core-Visitor' }
FASTComment >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTComment: self
]

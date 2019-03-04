Extension { #name : #FASTEntitySourceAnchor }

{ #category : #'*FAST-Core-Visitor' }
FASTEntitySourceAnchor >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTEntitySourceAnchor: self
]

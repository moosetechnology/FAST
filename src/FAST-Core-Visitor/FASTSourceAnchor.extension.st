Extension { #name : #FASTSourceAnchor }

{ #category : #'*FAST-Core-Visitor' }
FASTSourceAnchor >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTSourceAnchor: self
]

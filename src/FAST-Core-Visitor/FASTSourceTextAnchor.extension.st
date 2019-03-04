Extension { #name : #FASTSourceTextAnchor }

{ #category : #'*FAST-Core-Visitor' }
FASTSourceTextAnchor >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTSourceTextAnchor: self
]

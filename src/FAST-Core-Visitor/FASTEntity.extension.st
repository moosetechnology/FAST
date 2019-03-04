Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTEntity: self
]

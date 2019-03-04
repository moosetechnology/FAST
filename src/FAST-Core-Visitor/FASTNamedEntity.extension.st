Extension { #name : #FASTNamedEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTNamedEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTNamedEntity: self
]

Extension { #name : #FASTSourcedEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTSourcedEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTSourcedEntity: self
]

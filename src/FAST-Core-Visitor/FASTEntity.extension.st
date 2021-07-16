Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTEntity >> accept: aVisitor [
	^ aVisitor visitFASTEntity: self
]

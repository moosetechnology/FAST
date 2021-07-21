Extension { #name : #FASTTNamedEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTNamedEntity >> accept: aVisitor [
	^ aVisitor visitFASTTNamedEntity: self
]

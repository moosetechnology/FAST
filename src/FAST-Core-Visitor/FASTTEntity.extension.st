Extension { #name : #FASTTEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTEntity >> accept: aVisitor [
	^ aVisitor visitFASTTEntity: self
]

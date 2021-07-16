Extension { #name : #FASTTScopableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTScopableEntity >> accept: aVisitor [
	^ aVisitor visitFASTTScopableEntity: self
]

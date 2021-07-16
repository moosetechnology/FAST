Extension { #name : #FASTTVariableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTVariableEntity >> accept: aVisitor [
	^ aVisitor visitFASTTVariableEntity: self
]

Extension { #name : #FASTTVariableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTVariableEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTVariableEntity: self
]

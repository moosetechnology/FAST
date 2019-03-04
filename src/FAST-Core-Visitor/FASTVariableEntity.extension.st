Extension { #name : #FASTVariableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTVariableEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTVariableEntity: self
]

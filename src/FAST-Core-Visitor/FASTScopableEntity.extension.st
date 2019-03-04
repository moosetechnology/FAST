Extension { #name : #FASTScopableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTScopableEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTScopableEntity: self
]

Extension { #name : #FASTTScopableEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTScopableEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTScopableEntity: self
]

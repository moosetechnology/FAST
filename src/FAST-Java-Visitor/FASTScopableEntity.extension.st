Extension { #name : #FASTScopableEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTScopableEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTScopableEntity: self
]

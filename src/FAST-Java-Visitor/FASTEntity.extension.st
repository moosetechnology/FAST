Extension { #name : #FASTEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTEntity: self
]

Extension { #name : #FASTNamedEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTNamedEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTNamedEntity: self
]

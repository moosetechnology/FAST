Extension { #name : #FASTVariableEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTVariableEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTVariableEntity: self
]

Extension { #name : #FASTTNamedEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTNamedEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTNamedEntity: self
]

Extension { #name : #FASTTEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTEntity: self
]

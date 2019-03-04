Extension { #name : #FASTAssociation }

{ #category : #'*FAST-Core-Visitor' }
FASTAssociation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTAssociation: self
]

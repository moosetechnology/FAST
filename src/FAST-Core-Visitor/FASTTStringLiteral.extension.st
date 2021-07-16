Extension { #name : #FASTTStringLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTStringLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTStringLiteral: self
]

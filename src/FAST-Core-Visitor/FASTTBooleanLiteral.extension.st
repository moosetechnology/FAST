Extension { #name : #FASTTBooleanLiteral }

{ #category : #'*FAST-Core-Visitor' }
FASTTBooleanLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTBooleanLiteral: self
]

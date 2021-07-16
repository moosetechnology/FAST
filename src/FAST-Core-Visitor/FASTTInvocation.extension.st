Extension { #name : #FASTTInvocation }

{ #category : #'*FAST-Core-Visitor' }
FASTTInvocation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTInvocation: self
]

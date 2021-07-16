Extension { #name : #FASTTInvocation }

{ #category : #'*FAST-Core-Visitor' }
FASTTInvocation >> accept: aVisitor [
	^ aVisitor visitFASTTInvocation: self
]

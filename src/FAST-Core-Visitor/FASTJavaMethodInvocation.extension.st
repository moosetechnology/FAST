Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Core-Visitor' }
FASTJavaMethodInvocation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMethodInvocation: self
]

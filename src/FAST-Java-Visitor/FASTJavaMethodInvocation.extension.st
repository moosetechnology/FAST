Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodInvocation >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaMethodInvocation: self
]

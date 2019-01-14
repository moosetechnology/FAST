Extension { #name : #FASTJavaFieldAccess }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaFieldAccess >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaFieldAccess: self
]

Extension { #name : #FASTJavaInitializer }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaInitializer >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaInitializer: self
]

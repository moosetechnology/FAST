Extension { #name : #FASTJavaNewArray }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaNewArray >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewArray: self
]

Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaDoStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaDoStatement: self
]

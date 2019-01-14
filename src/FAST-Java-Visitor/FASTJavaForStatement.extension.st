Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaForStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaForStatement: self
]

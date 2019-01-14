Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaWhileStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaWhileStatement: self
]

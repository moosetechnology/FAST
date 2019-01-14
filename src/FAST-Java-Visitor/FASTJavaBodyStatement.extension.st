Extension { #name : #FASTJavaBodyStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaBodyStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaBodyStatement: self
]

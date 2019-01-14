Extension { #name : #FASTJavaForEachStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaForEachStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaForEachStatement: self
]

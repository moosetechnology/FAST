Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIfStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaIfStatement: self
]

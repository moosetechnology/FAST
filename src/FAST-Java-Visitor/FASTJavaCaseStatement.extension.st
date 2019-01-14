Extension { #name : #FASTJavaCaseStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCaseStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaCaseStatement: self
]

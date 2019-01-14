Extension { #name : #FASTJavaContinueStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaContinueStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaContinueStatement: self
]

Extension { #name : #FASTJavaBreakStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaBreakStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaBreakStatement: self
]

Extension { #name : #FASTStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTStatement: self
]

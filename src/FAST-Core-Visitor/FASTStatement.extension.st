Extension { #name : #FASTStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTStatement: self
]

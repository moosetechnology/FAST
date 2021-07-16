Extension { #name : #FASTTStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTStatement: self
]

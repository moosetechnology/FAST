Extension { #name : #FASTTStatement }

{ #category : #'*FAST-Core-Visitor' }
FASTTStatement >> accept: aVisitor [
	^ aVisitor visitFASTTStatement: self
]

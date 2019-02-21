Extension { #name : #FASTEntitySourceAnchor }

{ #category : #'*FAST-Java-Visitor' }
FASTEntitySourceAnchor >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTEntitySourceAnchor: self
]

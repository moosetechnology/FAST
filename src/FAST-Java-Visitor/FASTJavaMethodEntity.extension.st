Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaMethodEntity: self
]

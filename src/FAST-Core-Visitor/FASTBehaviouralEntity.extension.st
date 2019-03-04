Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTBehaviouralEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTBehaviouralEntity: self
]

Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTBehaviouralEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTBehaviouralEntity: self
]

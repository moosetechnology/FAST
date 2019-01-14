Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTNamedBehaviouralEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTNamedBehaviouralEntity: self
]

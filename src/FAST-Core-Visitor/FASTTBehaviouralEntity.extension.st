Extension { #name : #FASTTBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTBehaviouralEntity >> accept: aVisitor [
	^ aVisitor visitFASTTBehaviouralEntity: self
]

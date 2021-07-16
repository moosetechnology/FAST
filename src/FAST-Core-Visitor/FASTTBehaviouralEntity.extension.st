Extension { #name : #FASTTBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTBehaviouralEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTBehaviouralEntity: self
]

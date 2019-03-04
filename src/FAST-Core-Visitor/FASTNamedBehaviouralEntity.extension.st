Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTNamedBehaviouralEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTNamedBehaviouralEntity: self
]

Extension { #name : #FASTTNamedBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTNamedBehaviouralEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTTNamedBehaviouralEntity: self
]

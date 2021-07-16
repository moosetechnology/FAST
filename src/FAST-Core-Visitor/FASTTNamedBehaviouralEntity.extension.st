Extension { #name : #FASTTNamedBehaviouralEntity }

{ #category : #'*FAST-Core-Visitor' }
FASTTNamedBehaviouralEntity >> accept: aVisitor [
	"Arbitrary use of an accept: available in the used features (FASTTNamedEntity or FASTTBehaviouralEntity)"
	^ aVisitor visitFASTTNamedBehaviouralEntity: self
]

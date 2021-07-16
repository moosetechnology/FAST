Extension { #name : #FASTTVariableExpression }

{ #category : #'*FAST-Core-Visitor' }
FASTTVariableExpression >> accept: aVisitor [
	"Arbitrary use of an accept: available in the used traits (FASTVariable or FASTTExpression)"
	^ aVisitor visitFASTTVariableExpression: self
]

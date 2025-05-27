Extension { #name : 'FASTTVariableExpression' }

{ #category : '*FAST-Core-Visitor' }
FASTTVariableExpression >> accept: aVisitor [
	^ aVisitor visitFASTTVariableExpression: self
]

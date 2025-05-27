Extension { #name : 'FASTTConditionalStatement' }

{ #category : '*FAST-Core-Visitor' }
FASTTConditionalStatement >> accept: aVisitor [
	^ aVisitor visitFASTTConditionalStatement: self
]

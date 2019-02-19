Extension { #name : #FASTJavaConditionalStatement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaConditionalStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaConditionalStatement: self
]

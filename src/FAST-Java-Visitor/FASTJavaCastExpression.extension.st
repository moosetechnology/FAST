Extension { #name : #FASTJavaCastExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCastExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaCastExpression: self
]

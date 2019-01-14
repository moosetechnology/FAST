Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaInfixOperation >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaInfixOperation: self
]

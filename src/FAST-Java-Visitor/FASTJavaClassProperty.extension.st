Extension { #name : #FASTJavaClassProperty }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaClassProperty >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaClassProperty: self
]

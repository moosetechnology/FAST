Extension { #name : #FASTJavaIdentifier }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIdentifier >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaIdentifier: self
]

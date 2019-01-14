Extension { #name : #FASTJavaVariableDeclarator }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaVariableDeclarator >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaVariableDeclarator: self
]

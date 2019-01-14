Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaVarDeclStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaVarDeclStatement: self
]

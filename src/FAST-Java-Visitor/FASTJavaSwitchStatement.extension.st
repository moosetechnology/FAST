Extension { #name : #FASTJavaSwitchStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaSwitchStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaSwitchStatement: self
]

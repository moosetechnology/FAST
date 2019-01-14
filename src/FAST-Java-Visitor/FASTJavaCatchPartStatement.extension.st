Extension { #name : #FASTJavaCatchPartStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCatchPartStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaCatchPartStatement: self
]

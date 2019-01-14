Extension { #name : #FASTJavaConditionStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaConditionStatement >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaConditionStatement: self
]

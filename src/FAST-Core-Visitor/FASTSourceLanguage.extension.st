Extension { #name : #FASTSourceLanguage }

{ #category : #'*FAST-Core-Visitor' }
FASTSourceLanguage >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTSourceLanguage: self
]

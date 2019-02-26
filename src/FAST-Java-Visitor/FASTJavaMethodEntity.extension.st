Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodEntity >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaMethodEntity: self
]

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodEntity >> sourceText [
	^ self source ifNil: [ self parentNode ifNil: [ nil ] ifNotNil: [ parentNode sourceText ] ]
]

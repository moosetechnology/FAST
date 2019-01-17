Extension { #name : #FASTJavaNewClassMethodStatment }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassMethodStatment >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewClassMethodStatment: self
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassMethodStatment >> addChild: child [
	self childrenNode add: child
]

Extension { #name : #FASTJavaNewClassExpression }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassExpression >> accept: aFASTVisitor [
	^ aFASTVisitor visitFASTJavaNewClassExpression: self
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassExpression >> addMethod: aFASTJavaMethodDeclaration [
	childrenNode
		add:
			(FASTJavaNewClassMethodStatment new
				addChild: aFASTJavaMethodDeclaration;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassExpression >> methods [
	<computed>
	<navigation: 'methods'>
	^ (self childrenNode
		select: [ :childNode | childNode isKindOf: FASTJavaNewClassMethodStatment ])
		flatCollect: #childrenNode
]

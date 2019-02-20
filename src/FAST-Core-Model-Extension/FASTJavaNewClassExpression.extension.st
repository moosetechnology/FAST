Extension { #name : #FASTJavaNewClassExpression }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewClassExpression >> addMethod: aFASTJavaMethodDeclaration [
	self childrenNode
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
		select: [ :childNode | childNode class = FASTJavaNewClassMethodStatment ])
]

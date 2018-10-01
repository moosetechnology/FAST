Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaVarDeclStatement >> addDeclarator: aDeclarator [
	self childrenNode add: aDeclarator
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaVarDeclStatement >> declarators [
	<navigation: 'FASTJavaVariableDeclarator'>
	^ self childrenNode select: [ :child | child class isKindOf: FASTJavaVariableDeclarator class ]
]

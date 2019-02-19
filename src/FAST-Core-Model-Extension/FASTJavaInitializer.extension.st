Extension { #name : #FASTJavaInitializer }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInitializer >> statementBlock [
	^ (self childrenNode
		select: [ :child | child class = FASTStatementBlock ])
		anyOne
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInitializer >> statementBlock: aJavaStatementBlock [
	self childrenNode add: aJavaStatementBlock
]

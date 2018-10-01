Extension { #name : #FASTExpressionStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTExpressionStatement >> expression: aStatement [
	self childrenNode add: aStatement
]

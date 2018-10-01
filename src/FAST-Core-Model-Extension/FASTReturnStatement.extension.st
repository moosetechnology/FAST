Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTReturnStatement >> expression [
	^ self childrenNode first
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTReturnStatement >> expression: aStatement [
	self childrenNode add: aStatement
]

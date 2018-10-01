Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodEntity >> statementBlock [
	^ self childrenNode first
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodEntity >> statementBlock: aJavaStatementBlock [
	self childrenNode add: aJavaStatementBlock
]

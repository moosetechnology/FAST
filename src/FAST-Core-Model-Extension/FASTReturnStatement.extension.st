Extension { #name : #FASTReturnStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTReturnStatement >> expression [
	^ self childrenNode ifNotEmpty: [ :children | children anyOne ] ifEmpty: nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTReturnStatement >> expression: aStatement [
	self childrenNode add: aStatement
]

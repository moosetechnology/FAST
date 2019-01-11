Extension { #name : #FASTExpressionStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTExpressionStatement >> addExpression: aStatement [
	self childrenNode add: aStatement
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTExpressionStatement >> expression [
	<navigation: 'expression'>
	^ self childrenNode first
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTExpressionStatement >> expression: aStatement [
	self childrenNode add: aStatement
]

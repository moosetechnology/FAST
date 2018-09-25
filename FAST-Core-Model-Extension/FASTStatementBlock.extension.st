Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Core-Model-Extension' }
FASTStatementBlock >> statements [
	<computed>
	<navigation: 'statements'>
	^ self childrenNode select: [ :child | child class isKindOf: FASTStatement class ]
]

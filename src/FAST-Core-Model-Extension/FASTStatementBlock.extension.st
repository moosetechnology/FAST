Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Core-Model-Extension' }
FASTStatementBlock >> addStatement: aStatement [
	aStatement isCollection ifTrue: [ self childrenNode addAll: aStatement  ] ifFalse: [ self childrenNode add: aStatement ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTStatementBlock >> statements [
	<computed>
	<navigation: 'statements'>
	^ self childrenNode select: [ :child | child class isKindOf: FASTStatement class ]
]

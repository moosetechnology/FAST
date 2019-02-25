Extension { #name : #FASTJavaCaseStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCaseStatement >> addStatement: aStatement [
	aStatement isCollection
		ifTrue: [ self childrenNode addAll: aStatement ]
		ifFalse: [ self childrenNode add: aStatement ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCaseStatement >> statements [
	<computed>
	<navigation: 'statements'>
	^ self childrenNode select: [ :child | child isKindOf: FASTStatement ]
]

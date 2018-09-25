Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaDoStatement >> bodyStatement [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaBodyStatement class ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaDoStatement >> conditionStatement [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1
]

Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaDoStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaBodyStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaDoStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

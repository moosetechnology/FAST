Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> bodyStatement [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaBodyStatement class ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> conditionStatement [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1
]

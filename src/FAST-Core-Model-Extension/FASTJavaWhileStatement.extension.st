Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaBodyStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> body: aFASTJavaBodyStatement [
	self childrenNode add: aFASTJavaBodyStatement

]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode add: aFASTJavaConditionStatement
]

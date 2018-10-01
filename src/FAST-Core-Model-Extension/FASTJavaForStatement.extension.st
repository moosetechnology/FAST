Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaBodyStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> incrementors [
	<computed>
	<navigation: 'incrementors'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaIncrementorsStatement class ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> initializers [
	<computed>
	<navigation: 'initializers'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaInitializersStatement class ]) 
]

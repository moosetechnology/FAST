Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> bodyStatement [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaBodyStatement class ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> conditionStatement [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> incrementorsStatement [
	<computed>
	<navigation: 'incrementors'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaIncrementorsStatement class ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> initializersStatement [
	<computed>
	<navigation: 'initializers'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaInitializersStatement class ]) 
]

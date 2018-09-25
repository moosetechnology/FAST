Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> conditionStatement [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaConditionStatement ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> elsePartStatement [
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> thenPartStatement [
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) at: 1
]

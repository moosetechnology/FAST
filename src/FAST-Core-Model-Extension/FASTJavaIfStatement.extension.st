Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaConditionStatement ]) at: 1 ifAbsent: [ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode add: aFASTJavaConditionStatement
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> elsePart [
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1 ifAbsent: [ ^ nil ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> elsePart: aFASTJavaElsePartStatement [
	self childrenNode add: aFASTJavaElsePartStatement
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> thenPart [
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaIfStatement >> thenPart: aFASTJavaThenPartStatement [
	self childrenNode add: aFASTJavaThenPartStatement
]

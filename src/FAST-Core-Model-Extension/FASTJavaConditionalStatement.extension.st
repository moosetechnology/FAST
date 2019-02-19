Extension { #name : #FASTJavaConditionalStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class =  FASTJavaConditionStatement ]) at: 1 ifAbsent: [ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode
		add:
			(FASTJavaConditionStatement new
				addChild: aFASTJavaConditionStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> elsePart [
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1 ifAbsent: [ ^ nil ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> elsePart: aFASTJavaElsePartStatement [
	self childrenNode
		add:
			(FASTJavaElsePartStatement new
				addChild: aFASTJavaElsePartStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> thenPart [
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) anyOne
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaConditionalStatement >> thenPart: aFASTJavaThenPartStatement [
	self childrenNode add: (FASTJavaThenPartStatement new
				addChild: aFASTJavaThenPartStatement;
				yourself)
]

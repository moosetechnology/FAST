Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaBodyStatement  ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> body: aFASTJavaBodyStatement [
	self childrenNode add: (FASTJavaBodyStatement new
				addChild: aFASTJavaBodyStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaConditionStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaWhileStatement >> condition: aFASTJavaConditionStatement [
	self childrenNode add: 	(FASTJavaConditionStatement new
				addChild: aFASTJavaConditionStatement;
				yourself)
]

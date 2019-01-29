Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> body [
	<computed>
	<navigation: 'body'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaBodyStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> body: aBodyStatement [
	childrenNode
		add:
			(FASTJavaBodyStatement new
				addChild: aBodyStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> condition [
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaConditionStatement ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> condition: aConditionStatement [
	self childrenNode
		add:
			(FASTJavaConditionStatement new
				addChild: aConditionStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> incrementors [
	<computed>
	<navigation: 'incrementors'>
	^ self childrenNode
		select: [ :childNode | childNode class =  FASTJavaIncrementorsStatement ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> incrementors: aIncrementorStatement [
	self childrenNode add: (FASTJavaIncrementorsStatement new
				addChild: aIncrementorStatement;
				yourself)
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> initializers [
	<computed>
	<navigation: 'initializers'>
	^ self childrenNode
		select:
			[ :childNode | childNode class =  FASTJavaInitializersStatement ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaForStatement >> initializers: aInitializerStatement [
	self childrenNode
		add:
			(FASTJavaInitializersStatement new
				addChild:  aInitializerStatement;
				yourself)
]

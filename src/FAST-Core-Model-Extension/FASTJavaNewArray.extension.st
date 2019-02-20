Extension { #name : #FASTJavaNewArray }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewArray >> addInitializer: anInitializer [
	self childrenNode add: anInitializer
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewArray >> initializers [
	<computed>
	<navigation: 'initializers'>
	^ self childrenNode select: [ :child | child ~= self type ]
]

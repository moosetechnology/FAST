Extension { #name : #FASTJavaBodyStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaBodyStatement >> addChild: child [
	self childrenNode add: child
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaBodyStatement >> statements [
	<computed>
	^ childrenNode flatCollect: #statements
]

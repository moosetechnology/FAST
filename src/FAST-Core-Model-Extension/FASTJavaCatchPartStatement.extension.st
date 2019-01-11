Extension { #name : #FASTJavaCatchPartStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCatchPartStatement >> addChild: child [
	self childrenNode add: child
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCatchPartStatement >> addParameter: aParameter [
	self childrenNode add: aParameter
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCatchPartStatement >> parameters [
	<computed>
	<navigation: 'parameters'>
	^ self childrenNode
		select: [ :childNode | 
			{FASTVariableEntity class.
			FASTNamedEntity} includes: childNode class ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCatchPartStatement >> statements [
	<computed>
	^ childrenNode flatCollect: #statements
]

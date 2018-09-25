Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> parameters [
	<computed>
	<navigation: 'parameters'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableEntity class ])
]

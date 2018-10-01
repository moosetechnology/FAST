Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> parameters [
	<computed>
	<navigation: 'parameters'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableEntity class ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> statements [
	<MSEProperty: #statements type: #FASTStatement>
	<multivalued>
	<derived>
	<MSEComment: 'Statements of the behavioural entity'>
	^ self childrenNode first statements
]

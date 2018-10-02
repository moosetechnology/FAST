Extension { #name : #FASTBehaviouralEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> addParameter: aParameter [
	self childrenNode add: aParameter
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> parameters [
	<computed>
	<navigation: 'parameters'>
	^ (self childrenNode select: [ :childNode | ({FASTVariableEntity class. FASTNamedEntity }) includes: childNode class  ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTBehaviouralEntity >> statements [
	<MSEProperty: #statements type: #FASTStatement>
	<multivalued>
	<derived>
	<MSEComment: 'Statements of the behavioural entity'>
	^ (self childrenNode select: [ :child | child class isKindOf: FASTStatement class ] )first statements
]

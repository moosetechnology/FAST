Extension { #name : #FAMIXNamedEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FAMIXNamedEntity >> fastNamedEntities [
	<MSEProperty: #fastNamedEntities type: #FASTVariableEntity opposite: #famixNamedEntity>
	<multivalued>
	<MSEComment: 'Fast named entities used in AST that correspond to this entity'>
	^ self privateState cacheAt: #fastNamedEntities ifAbsentPut:
		[FMMultivalueLink on: self opposite: #famixNamedEntity:]
]

{ #category : #'*FAST-Core-Model-Extension' }
FAMIXNamedEntity >> fastNamedEntities: entities [
	^ self fastNamedEntities value: entities
]

Extension { #name : #FASTVariableEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTVariableEntity >> famixNamedEntity [
	<MSEProperty: #famixNamedEntity type: #FAMIXNamedEntity opposite: #fastNamedEntities>
	<MSEComment: 'Corresponding Famix named entity AKA meta-variable for symbol resolution'>
	<navigation: 'famixNamedEntity'>
	^ self privateState attributeAt: #famixNamedEntity ifAbsent: nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTVariableEntity >> famixNamedEntity: aNamedEntity [
	self privateState attributeAt: #famixNamedEntity put: aNamedEntity.	
		
	"Statement below added to ensure consistency
	of this one-to-one relationship"
	aNamedEntity fastNamedEntities = self
		ifFalse: [ aNamedEntity fastNamedEntities: self ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTVariableEntity >> parentBehaviouralEntity [
	<computed>
	<navigation: 'parentBehaviouralEntity'>
	^ parentNode
]

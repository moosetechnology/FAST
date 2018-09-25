Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTNamedBehaviouralEntity >> famixNamedEntity [
	<MSEProperty: #famixNamedEntity type: #FAMIXBehaviouralEntity opposite: #fastBehaviouralEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	<navigation: 'famixNamedEntity'>
	^ self privateState attributeAt: #famixNamedEntity ifAbsent: nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTNamedBehaviouralEntity >> famixNamedEntity: aFamixBehaviouralEntity [
	self privateState attributeAt: #famixNamedEntity put: aFamixBehaviouralEntity.	
		
	"Statement below added to ensure consistency
	of this one-to-one relationship"
	aFamixBehaviouralEntity fastBehaviouralEntity = self
		ifFalse: [ aFamixBehaviouralEntity fastBehaviouralEntity: self ]
]

Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FAMIXBehaviouralEntity >> fastBehaviouralEntity [
	<MSEProperty: #fastBehaviouralEntity type: #FASTNamedBehaviouralEntity opposite: #famixNamedEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	^ self privateState attributeAt: #fastBehaviouralEntity ifAbsent: nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FAMIXBehaviouralEntity >> fastBehaviouralEntity: aNamedBehaviouralEntity [
	self privateState attributeAt: #fastBehaviouralEntity put: aNamedBehaviouralEntity.	
		
	"Statement below added to ensure consistency
	of this one-to-one relationship"
	aNamedBehaviouralEntity famixNamedEntity = self
		ifFalse: [ aNamedBehaviouralEntity famixNamedEntity: self ]
]

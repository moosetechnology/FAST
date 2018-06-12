*FAST-Core-Model-Extension
famixNamedEntity
	<MSEProperty: #fastBehaviouralEntity type: #FASTNamedBehaviouralEntity opposite: #famixNamedEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	^ self privateState attributeAt: #fastBehaviouralEntity ifAbsent: nil
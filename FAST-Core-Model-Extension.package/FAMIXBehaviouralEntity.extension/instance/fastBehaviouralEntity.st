*FAST-Core-Model-Extension
fastBehaviouralEntity
	<MSEProperty: #fastBehaviouralEntity type: #FASTNamedBehaviouralEntity opposite: #famixNamedEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	^ self privateState attributeAt: #fastBehaviouralEntity ifAbsent: nil
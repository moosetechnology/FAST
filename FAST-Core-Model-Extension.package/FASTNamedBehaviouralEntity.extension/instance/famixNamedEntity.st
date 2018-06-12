*FAST-Core-Model-Extension
famixNamedEntity
	<MSEProperty: #famixNamedEntity type: #FAMIXBehaviouralEntity opposite: #fastBehaviouralEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	^ self privateState attributeAt: #famixNamedEntity ifAbsent: nil
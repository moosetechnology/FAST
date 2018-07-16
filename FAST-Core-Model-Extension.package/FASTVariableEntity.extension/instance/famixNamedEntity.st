*FAST-Core-Model-Extension
famixNamedEntity
	<MSEProperty: #famixNamedEntity type: #FAMIXNamedEntity opposite: #fastNamedEntities>
	<MSEComment: 'Corresponding Famix named entity AKA meta-variable for symbol resolution'>
	<navigation: 'famixNamedEntity'>
	^ self privateState attributeAt: #famixNamedEntity ifAbsent: nil
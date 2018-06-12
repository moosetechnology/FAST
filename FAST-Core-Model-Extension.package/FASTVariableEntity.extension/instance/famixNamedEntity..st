*FAST-Core-Model-Extension
famixNamedEntity: aNamedEntity
	self privateState attributeAt: #famixNamedEntity put: aNamedEntity.	
		
	"Statement below added to ensure consistency
	of this one-to-one relationship"
	aNamedEntity fastNamedEntities = self
		ifFalse: [ aNamedEntity fastNamedEntities: self ]
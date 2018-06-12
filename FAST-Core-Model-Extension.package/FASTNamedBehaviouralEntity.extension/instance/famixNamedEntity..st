*FAST-Core-Model-Extension
famixNamedEntity: aFamixBehaviouralEntity
	self privateState attributeAt: #famixNamedEntity put: aFamixBehaviouralEntity.	
		
	"Statement below added to ensure consistency
	of this one-to-one relationship"
	aFamixBehaviouralEntity fastBehaviouralEntity = self
		ifFalse: [ aFamixBehaviouralEntity fastBehaviouralEntity: self ]
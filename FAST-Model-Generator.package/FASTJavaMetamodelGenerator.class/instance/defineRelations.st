definition
defineRelations
	super defineRelations.
	(entity property: #parentNode) -* (entity property: #childrenNode)
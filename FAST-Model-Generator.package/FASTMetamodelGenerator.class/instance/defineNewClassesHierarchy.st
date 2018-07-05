definition
defineNewClassesHierarchy
	expression --|> entity.
	literal --|> expression.
	booleanLiteral --|> literal.
	characterLiteral --|> literal.
	nullPointerLiteral --|> literal.
	stringLiteral --|> literal.
	variableExpression --|> expression.
	scopableEntity --|> entity.
	behaviouralEntity --|> scopableEntity.
	namedBehaviouralEntity --|> behaviouralEntity.
	statement --|> scopableEntity.
	expressionStatement --|> statement.
	returnStatement --|> statement.
	statementBlock --|> statement.
	
	self flag: 'pourquoi ce n''est pas un #TNamed ?'.
	variableEntity --|> entity.
	
	self flag: 'Non, puisqu''on a namedBehaviouralEntity'.
	behaviouralEntity --|> #TNamed.

	entity --|> #TEntityMetaLevelDependency.
	entity --|> #TDependencyQueries.
	entity --|> #TWithSourceAnchor
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
	variableEntity --|> entity.
	
	variableEntity --|> #TNamed.
	variableExpression --|> #TNamed.
	namedBehaviouralEntity --|> #TNamed.
	entity --|> #TEntityMetaLevelDependency.
	entity --|> #TDependencyQueries.
	entity --|> #TWithSourceAnchor
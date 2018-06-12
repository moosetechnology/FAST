definition
defineNewClasses
	entity := builder newClassNamed: #Entity.
	expression := builder newClassNamed: #Expression.
	literal := builder newClassNamed: #Literal.
	booleanLiteral := builder newClassNamed: #BooleanLiteral.
	characterLiteral := builder newClassNamed: #CharacterLiteral.
	nullPointerLiteral := builder newClassNamed: #NullPointerLiteral.
	stringLiteral := builder newClassNamed: #StringLiteral.
	variableExpression := builder newClassNamed: #VariableExpression.
	scopableEntity := builder newClassNamed: #ScopableEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	namedBehaviouralEntity := builder newClassNamed: #NamedBehaviouralEntity.
	statement := builder newClassNamed: #Statement.
	expressionStatement := builder newClassNamed: #ExpressionStatement.
	returnStatement := builder newClassNamed: #ReturnStatement.
	statementBlock := builder newClassNamed: #StatementBlock.
	variableEntity := builder newClassNamed: #VariableEntity.
	namedEntity := builder newClassNamed: #NamedEntity
definition
defineNewClassesHierarchy
	super defineNewClassesHierarchy.
	javaAssignementExpression --|> expression.
	javaBreakStatement --|> statement.
	javaCaseStatement --|> statement.
	javaCharacterLiteral --|> characterLiteral.
	javaContinueStatement --|> statement.
	javaDoStatement --|> statement.
	javaFieldAccess --|> expression.
	javaFloatLiteral --|> literal.
	javaForStatement --|> statement.
	javaIdentifier --|> variableExpression.
	javaIfStatement --|> statement.
	javaInfixOperation --|> expression.
	javaIntegerLiteral --|> literal.
	javaMethodEntity --|> namedBehaviouralEntity.
	javaMethodInvocation --|> expression.
	javaNullLiteral --|> nullPointerLiteral.
	javaSeparator --|> variableExpression.
	javaStringLiteral --|> stringLiteral.
	javaSwitchStatement --|> statement.
	javaThis --|> variableExpression.
	javaVarDeclStatement --|> statement.
	javaVariableDeclarator --|> entity.
	javaWhileStatement --|> statement
definition
defineNewClasses
	self flag: 'pourquoi mettre les commentaires dans des methodes separees? Ca serait bien de les voir ici non?'.
	self flag: 'Edit Benoit 09/07/2018 : C est ce format qui est utilise dans FamixNG. Si les commentaires sont long on perd de la comprehension je trouve... Pour des commentaires je vois l interet'.
	
	entity := builder newClassNamed: #Entity comment: self commentForEntity.
	expression := builder newClassNamed: #Expression comment: self commentForExpression.
	literal := builder newClassNamed: #Literal comment: self commentForLiteral.
	booleanLiteral := builder newClassNamed: #BooleanLiteral comment: self commentForBooleanLiteral.
	characterLiteral := builder newClassNamed: #CharacterLiteral comment: self commentForCharacterLiteral.
	nullPointerLiteral := builder newClassNamed: #NullPointerLiteral comment: self commentForNullPointerLiteral.
	stringLiteral := builder newClassNamed: #StringLiteral comment: self commentForStringLiteral.
	variableExpression := builder newClassNamed: #VariableExpression comment: self commentForVariableExpression.
	scopableEntity := builder newClassNamed: #ScopableEntity comment: self commentForScopableEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity comment: self commentForBehaviouralEntity.
	namedBehaviouralEntity := builder newClassNamed: #NamedBehaviouralEntity comment: self commentForNamedBehaviouralEntity.
	statement := builder newClassNamed: #Statement comment: self commentForStatement.
	expressionStatement := builder newClassNamed: #ExpressionStatement comment: self commentForExpressionStatement.
	returnStatement := builder newClassNamed: #ReturnStatement comment: self commentForReturnStatement.
	statementBlock := builder newClassNamed: #StatementBlock comment: self commentForStatementBlock.
	variableEntity := builder newClassNamed: #VariableEntity comment: self commentForVariableEntity.
	namedEntity := builder newClassNamed: #NamedEntity
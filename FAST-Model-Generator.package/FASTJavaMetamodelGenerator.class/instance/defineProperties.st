definition
defineProperties
	super defineProperties.
	(javaFieldAccess property: #fieldName type: #String) comment: 'Name of accessed field'.
	(javaInfixOperation property: #operator type: #String) comment: 'operator''s symbol'.
	(javaSeparator property: #separator type: #String) comment: 'separator'.
	(javaVarDeclStatement property: #type type: #FAMIXType)
		comment: 'type of declared variables'.
	(javaVariableDeclarator property: #expression type: #FASTExpression)
		comment: 'Expression that''s being assigned upon declaration to the var'.
	(javaVariableDeclarator property: #variable type: #FASTNamedEntity)
		comment: 'Variable that''s being declared'
definition
defineNewClasses
	super defineNewClasses.
	javaAssignementExpression := builder newClassNamed: #JavaAssignementExpression comment: self commentForJavaAssignementExpression.
	javaBreakStatement := builder newClassNamed: #JavaBreakStatement comment: self commentForJavaBreakStatement.
	javaCaseStatement := builder newClassNamed: #JavaCaseStatement comment: self commentForJavaCaseStatement.
	javaCharacterLiteral := builder newClassNamed: #JavaCharacterLiteral comment: self commentForJavaCharacterLiteral.
	javaContinueStatement := builder newClassNamed: #JavaContinueStatement comment: self commentForJavaContinueStatement.
	javaDoStatement := builder newClassNamed: #JavaDoStatement comment: self commentForJavaDoStatement.
	javaFieldAccess := builder newClassNamed: #JavaFieldAccess comment: self commentForJavaFieldAccess.
	javaFloatLiteral := builder newClassNamed: #JavaFloatLiteral comment: self commentForJavaFloatLiteral.
	javaForStatement := builder newClassNamed: #JavaForStatement comment: self commentForJavaForStatement.
	javaIdentifier := builder newClassNamed: #JavaIdentifier comment: self commentForJavaIdentifier.
	javaIfStatement := builder newClassNamed: #JavaIfStatement comment: self commentForJavaIfStatement.
	javaInfixOperation := builder newClassNamed: #JavaInfixOperation comment: self commentForJavaInfixOperation.
	javaIntegerLiteral := builder newClassNamed: #JavaIntegerLiteral comment: self commentForJavaIntegerLiteral.
	javaMethodEntity := builder newClassNamed: #JavaMethodEntity comment: self commentForJavaMethodEntity.
	javaMethodInvocation := builder newClassNamed: #JavaMethodInvocation  comment: self commentForJavaMethodInvocation.
	javaNullLiteral := builder newClassNamed: #JavaNullLiteral comment: self commentForJavaNullLiteral.
	javaSeparator := builder newClassNamed: #JavaSeparator comment: self commentForJavaSeparator.
	javaStringLiteral := builder newClassNamed: #JavaStringLiteral comment: self commentForJavaStringLiteral.
	javaSwitchStatement := builder newClassNamed: #JavaSwitchStatement comment: self commentForJavaSwitchStatement.
	javaThis := builder newClassNamed: #JavaThis comment: self commentForJavaThis.
	javaVarDeclStatement := builder newClassNamed: #JavaVarDeclStatement comment: self commentForJavaVarDeclStatement.
	javaVariableDeclarator := builder newClassNamed: #JavaVariableDeclarator comment: self commentForJavaVariableDeclarator.
	javaWhileStatement := builder newClassNamed: #JavaWhileStatement comment: self commentForJavaWhileStatement.
	
	"factice"
	javaElsePartStatement :=  builder newClassNamed: #JavaElsePartStatement. 
	javaThenPartStatement := builder newClassNamed: #JavaThenPartStatement.
	javaConditionStatement := builder newClassNamed: #JavaConditionStatement.
	javaIncrementorsStatement := builder newClassNamed: #JavaIncrementorsStatement comment: 'ExpressionStatements evaluated at the end of each loop'.
	javaBodyStatement := builder newClassNamed: #JavaBodyStatement comment: 'A statement to be evaluated in the loop'.
	javaInitializersStatement := builder newClassNamed: #JavaInitializersStatement comment: 'ExpressionStatements used at initialization phase of a for loop'.
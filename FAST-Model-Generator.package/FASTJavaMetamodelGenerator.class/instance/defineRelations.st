definition
defineRelations
	super defineRelations.
	((javaAssignementExpression property: #expression) comment: 'Assigned expression') - ((expression property: #parentNode) comment: 'parentNode').
	self flag: 'We have removed NamedEntity'."We removed NamedEntity((javaAssignementExpression property: #variable) comment: 'An assignee variable') - ((namedEntity property: #parentNode) comment: 'parentNode')."
	((javaCaseStatement property: #expression) comment: 'Constant data of case to compare with')
		- ((expression property: #parentNode) comment: 'parentNode').
	((javaDoStatement property: #body) comment: 'A statement to be evaluated in the loop') - ((statement property: #parentNode) comment: 'parentNode').
	((javaDoStatement property: #condition) comment: 'Condition of loop evaluation') - ((expression property: #parentNode) comment: 'parentNode').
	((javaFieldAccess property: #expression) comment: 'Expression returning the object whose field is accessed')
		- ((expression property: #parentNode) comment: 'parentNode').
	((javaForStatement property: #body) comment: 'A statement to be evaluated in the loop') - ((statement property: #parentNode) comment: 'parentNode').
	((javaForStatement property: #condition) comment: 'Condition of loop evaluation') - ((expression property: #parentNode) comment: 'parentNode').
	((javaForStatement property: #incrementors) comment: 'ExpressionStatements evaluated at the end of each loop')
		-* ((expression property: #parentNode) comment: 'parentNode').
	((javaForStatement property: #initializers) comment: 'ExpressionStatements used at initialization phase of a for loop')
		-* ((expression property: #parentNode) comment: 'parentNode').
	((javaIfStatement property: #condition) comment: 'Condition of loop evaluation') - ((expression property: #parentNode) comment: 'parentNode').
	((javaIfStatement property: #elseBody) comment: 'A statement to be evaluated if condition result is false')
		- ((statement property: #parentNode) comment: 'parentNode').
	((javaIfStatement property: #thenBody) comment: 'A statement to be evaluated if condition result is true')
		- ((statement property: #parentNode) comment: 'parentNode').
	((javaInfixOperation property: #leftOperand) comment: 'Expression to the left of operator')
		- ((expression property: #parentNode) comment: 'parentNode').
	((javaInfixOperation property: #rightOperand) comment: 'Expression to the right of operator')
		- ((expression property: #parentNode) comment: 'parentNode').
	((javaMethodInvocation property: #arguments) comment: 'Arguments passed to method') -* ((expression property: #parentNode) comment: 'parentNode').
	((javaMethodInvocation property: #receiver) comment: 'Receiver of the message.') - ((expression property: #parentNode) comment: 'parentNode').
	((javaSwitchStatement property: #expression) comment: 'Expression which value will be used for case matching')
		- ((expression property: #parentNode) comment: 'parentNode').
	((javaSwitchStatement property: #statements) comment: 'Statements inside the switch') -* ((statement property: #parentNode) comment: 'parentNode').
	((javaVarDeclStatement property: #declarators) comment: 'Declarator fradments of the statement')
		-* ((javaVariableDeclarator property: #parentNode) comment: 'parentNode').
	((javaWhileStatement property: #body) comment: 'A statement to be evaluated in the loop') - ((statement property: #parentNode) comment: 'parentNode').
	((javaWhileStatement property: #condition) comment: 'Condition of loop evaluation') - ((expression property: #parentNode) comment: 'parentNode')
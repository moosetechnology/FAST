definition
defineRelations
	"in comment the old relation from the old FAST metamodel"
	((entity property: #parentNode) -* (entity property: #childrenNode)) withNavigation 

	"((expression property: #parentExpression) comment: 'Parent expression within which this expression appears (e.g. self=a+b and parent=2*(a+b)) ')
		-* ((expression property: #childrenExpressions) comment: 'Sub-expressions within this expression (e.g. self=2*(a+b) and child=a+b) ').
	((expression property: #parentStatement) comment: 'Parent statement containing this expression') - ((statement property: #childExpression) comment: 'Expression contained in this statement').
	((scopableEntity property: #localEntities) comment: 'Local entities (e.g. local variables) within the scope')
		-* ((entity property: #parentScopableEntity) comment: 'The parent entity of local entities (e.g. parent of a local variable)').
	((behaviouralEntity property: #parameters) comment: 'Parameters of the method') -* ((variableEntity property: #parentBehaviouralEntity)
		comment: 'A behavioual entity where this variable is defined as a parameter').
	((behaviouralEntity property: #statementBlock) comment: 'Statements block of the behavioural entity')
		- ((statementBlock property: #fastBehaviouralParent) comment: 'Behavioural entity containing the statement block.').
	((statement property: #statementContainer) comment: 'Block containing this statement.') *- ((statementBlock property: #statements) comment: 'Statements enclosed in this block')."
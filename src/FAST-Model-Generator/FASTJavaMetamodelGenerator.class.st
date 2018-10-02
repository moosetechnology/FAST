Class {
	#name : #FASTJavaMetamodelGenerator,
	#superclass : #FASTMetamodelGenerator,
	#instVars : [
		'javaAssignementExpression',
		'javaBreakStatement',
		'javaCaseStatement',
		'javaCharacterLiteral',
		'javaContinueStatement',
		'javaDoStatement',
		'javaFieldAccess',
		'javaFloatLiteral',
		'javaForStatement',
		'javaIdentifier',
		'javaIfStatement',
		'javaInfixOperation',
		'javaIntegerLiteral',
		'javaMethodEntity',
		'javaMethodInvocation',
		'javaNullLiteral',
		'javaSeparator',
		'javaStringLiteral',
		'javaSwitchStatement',
		'javaThis',
		'javaVarDeclStatement',
		'javaVariableDeclarator',
		'javaWhileStatement',
		'javaElsePartStatement',
		'javaThenPartStatement',
		'javaConditionStatement',
		'javaIncrementorsStatement',
		'javaBodyStatement',
		'javaInitializersStatement',
		'javaOperationLeftOperand',
		'javaOperationRightOperand'
	],
	#category : #'FAST-Model-Generator'
}

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaAssignementExpression [
	^ 'An assignment expression mode.

Contains a referances to an assignee assignee and the expression that''s being assigned.'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaBreakStatement [
	^ 'A node representing break statement in java'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaCaseStatement [
	^ 'case part of switch statement'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaCharacterLiteral [
	^ 'A character in Java code'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaContinueStatement [
	^ 'A node representing continue statement in java'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaDoStatement [
	^ 'A node of a do-while statement.

eg.
do {
...
} while(...);'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaFieldAccess [
	^ 'A FASTJavaFieldAccess corresponds to an access to an instance variable (field)'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaFloatLiteral [
	self flag: #todo.
	^ 'todo'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaForStatement [
	^ 'A node of a for loop statement.

eg.
for(_;_;_) {
...
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaIdentifier [
	^ 'A FASTJavaIdentifier is an identifier in a Java program'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaIfStatement [
	^ 'A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
...
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaInfixOperation [
	^ 'Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaIntegerLiteral [
	^ 'Java integer literal node'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaMethodEntity [
	^ 'Represents a method in FastJava'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaMethodInvocation [
	^ 'A node representing method imvocation'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaNullLiteral [
	^ '''null'' literal in Java'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaSeparator [
	self flag: #todo.
	^ 'todo'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaStringLiteral [
	^ 'A string in Java'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaSwitchStatement [
	^ 'A node representing switch stetement

eg.
switch (_) {
...
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaThis [
	^ 'A FASTJavaThis corresponds to ''this'' in Java'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaVarDeclStatement [
	^ 'A statement of variable declaration

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaVariableDeclarator [
	^ 'A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaWhileStatement [
	^ 'A node of a while statement.

eg.
while(...) {
...
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineNewClasses [
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
	javaOperationLeftOperand := builder newClassNamed: #JavaOperationLeftOperand.
	javaOperationRightOperand := builder newClassNamed: #JavaOperationRightOperand.
	javaIncrementorsStatement := builder newClassNamed: #JavaIncrementorsStatement comment: 'ExpressionStatements evaluated at the end of each loop'.
	javaBodyStatement := builder newClassNamed: #JavaBodyStatement comment: 'A statement to be evaluated in the loop'.
	javaInitializersStatement := builder newClassNamed: #JavaInitializersStatement comment: 'ExpressionStatements used at initialization phase of a for loop'.
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineNewClassesHierarchy [
	"define class hierarchy"
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
	javaWhileStatement --|> statement.
	
	javaMethodInvocation --|> #TNamed.
	
	"Factice"
	javaElsePartStatement --|> statement.
	javaThenPartStatement --|> statement.
	javaConditionStatement --|> statement.
	javaIncrementorsStatement --|> statement.
	javaBodyStatement --|> statement.
	javaInitializersStatement --|> statement.
	
	javaOperationLeftOperand --|> expression.
	javaOperationRightOperand --|> expression.
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineProperties [
	super defineProperties.
	(javaFieldAccess property: #fieldName type: #String) comment: 'Name of accessed field'.
	(javaInfixOperation property: #operator type: #String) comment: 'operator s symbol'.
	(javaSeparator property: #separator type: #String) comment: 'separator'.
	(javaVarDeclStatement property: #type type: #FAMIXType)
		comment: 'type of declared variables'.
	(javaVariableDeclarator property: #expression type: #FASTExpression)
		comment: 'Expression that s being assigned upon declaration to the var'.
	(javaVariableDeclarator property: #variable type: #FASTNamedEntity)
		comment: 'Variable that s being declared'.
	(javaAssignementExpression property: #expression type: #FASTExpression)
		comment: 'Expression that s being assigned upon declaration to the var'.
	(javaAssignementExpression property: #variable type: #FASTNamedEntity)
		comment: 'Variable that s being assigned'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineRelations [
	super defineRelations.
]

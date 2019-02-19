"
I contains the generator to create the Java FAST Metamodel


Use this to re generate the metamodel.


FASTJavaMetamodelGenerator new generate.
FASTJavaMetamodelGenerator resetMetamodel.
"
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
		'javaOperationRightOperand',
		'javaCastExpression',
		'javaClassProperty',
		'javaTryCatch',
		'javaTryPartStatement',
		'javaCatchPartStatement',
		'javaForEachStatement',
		'javaUnaryExpression',
		'javaNewExpression',
		'javaNewClassExpression',
		'javaNewClassMethodStatment',
		'javaNewArray',
		'javaConditionalStatement'
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
FASTJavaMetamodelGenerator >> commentForJavaClassProperty [
	^ 'A FASTJavaClassProperty corresponds to the access to a class property
	
	It is not the same as the field access because there are some specific usage of class property to access the current object.
	
ex.

class Enclosing {
    void method(Enclosing other) {
        // ...
    }

    void otherMethod() {
        new Runnable() {
            public void run() {
                method(this);


								--> Does not compile. ''this'' is a Runnable!



                method(Enclosing.this);

								--> Compiles fine.


            }
        }.run();
    }
}
'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaConditionalStatement [
	^ 'I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart'
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
FASTJavaMetamodelGenerator >> commentForJavaForEachStatement [
	^ 'A node of a for loop statement.

eg.
for(Patate p : list) {
...
}'
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
FASTJavaMetamodelGenerator >> commentForJavaNewArray [
	^ 'I represent a java new array node.
ex.

new String()["10px", "Hello world"]'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaNewClassExpression [
	^ 'I represent a new class expression (which is most of the time a new anonymous class)
	
	
ex. for SecureAsyncCallback

new SecureAsyncCallback<Void>() {
	@Override
	public void onSuccess(final Void result) {}
	
	@Override
	public void onFailure(final Throwable caught) {
		super.onFailure(caught);
	}
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaNewExpression [
	^ 'I represent the invocation of a Class constructor with the keyword ''new''

ex.

new Patate()'
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
FASTJavaMetamodelGenerator >> commentForJavaTryCatch [
	^ 'I represent the java try catch statement. I must have two parts: the ''Try'' part and the ''catch'' part. 
	
ex.

void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}

'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> commentForJavaUnaryExpression [
	^ 'I represent a Java Unary Expression
	
It can be :

++i
i++
--i
i--
!b
+i
-i

see: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op1.html'
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
FASTJavaMetamodelGenerator >> defineClasses [
	super defineClasses.
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
	javaMethodInvocation := builder newClassNamed: #JavaMethodInvocation comment: self commentForJavaMethodInvocation.
	javaNullLiteral := builder newClassNamed: #JavaNullLiteral comment: self commentForJavaNullLiteral.
	javaSeparator := builder newClassNamed: #JavaSeparator comment: self commentForJavaSeparator.
	javaStringLiteral := builder newClassNamed: #JavaStringLiteral comment: self commentForJavaStringLiteral.
	javaSwitchStatement := builder newClassNamed: #JavaSwitchStatement comment: self commentForJavaSwitchStatement.
	javaThis := builder newClassNamed: #JavaThis comment: self commentForJavaThis.
	javaVarDeclStatement := builder newClassNamed: #JavaVarDeclStatement comment: self commentForJavaVarDeclStatement.
	javaVariableDeclarator := builder newClassNamed: #JavaVariableDeclarator comment: self commentForJavaVariableDeclarator.
	javaWhileStatement := builder newClassNamed: #JavaWhileStatement comment: self commentForJavaWhileStatement.

	"new concept"
	javaCastExpression := builder newClassNamed: #JavaCastExpression comment: 'todo'.
	javaClassProperty := builder newClassNamed: #JavaClassProperty comment: self commentForJavaClassProperty.
	javaTryCatch := builder newClassNamed: #JavaTryCatchStatement comment: self commentForJavaTryCatch.
	javaForEachStatement := builder newClassNamed: #JavaForEachStatement comment: self commentForJavaForEachStatement.
	javaUnaryExpression := builder newClassNamed: #JavaUnaryExpression comment: self commentForJavaUnaryExpression.
	javaNewExpression := builder newClassNamed: #JavaNewExpression comment: self commentForJavaNewExpression.
	javaNewClassExpression := builder newClassNamed: #JavaNewClassExpression comment: self commentForJavaNewClassExpression.
	javaNewArray := builder newClassNamed: #JavaNewArray comment: self commentForJavaNewArray.
	javaConditionalStatement := builder newClassNamed: #JavaConditionalStatement comment: self commentForJavaConditionalStatement.

	"factice"
	javaElsePartStatement := builder newClassNamed: #JavaElsePartStatement.
	javaThenPartStatement := builder newClassNamed: #JavaThenPartStatement.
	javaConditionStatement := builder newClassNamed: #JavaConditionStatement.
	javaOperationLeftOperand := builder newClassNamed: #JavaOperationLeftOperand.
	javaOperationRightOperand := builder newClassNamed: #JavaOperationRightOperand.
	javaIncrementorsStatement := builder newClassNamed: #JavaIncrementorsStatement comment: 'ExpressionStatements evaluated at the end of each loop'.
	javaBodyStatement := builder newClassNamed: #JavaBodyStatement comment: 'A statement to be evaluated in the loop'.
	javaInitializersStatement := builder newClassNamed: #JavaInitializersStatement comment: 'ExpressionStatements used at initialization phase of a for loop'.
	javaNewClassMethodStatment := builder newClassNamed: #JavaNewClassMethodStatment comment: 'I''m a factice entity that is used by JavaNewClassExpression to represents the defined method of a class'.

	"new factice"
	javaTryPartStatement := builder newClassNamed: #JavaTryPartStatement comment: 'I represent the ''try'' part of the TryCatch Statement'.
	javaCatchPartStatement := builder newClassNamed: #JavaCatchPartStatement comment: 'I represent the ''catch'' part of the TryCatch Statement'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.
	javaAssignementExpression --|> expression.
	javaFieldAccess --|> expression.
	javaInfixOperation --|> expression.
	javaBreakStatement --|> statement.
	javaCaseStatement --|> statement.
	javaCharacterLiteral --|> characterLiteral.
	javaContinueStatement --|> statement.
	javaDoStatement --|> statement.
	javaFloatLiteral --|> literal.
	javaForStatement --|> statement.
	javaIdentifier --|> variableExpression.
	javaIfStatement --|> statement.
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

	"New"
	javaCastExpression --|> expression.
	javaClassProperty --|> expression.
	javaTryCatch --|> statement.
	javaForEachStatement --|> statement.
	javaUnaryExpression --|> expression.
	javaNewExpression --|> expression.
	javaNewClassExpression --|> javaNewExpression.
	javaNewArray --|> javaNewExpression.
	javaConditionalStatement --|> statement.

	"Factice"
	javaElsePartStatement --|> statement.
	javaThenPartStatement --|> statement.
	javaConditionStatement --|> statement.
	javaIncrementorsStatement --|> statement.
	javaBodyStatement --|> statement.
	javaInitializersStatement --|> statement.
	javaOperationLeftOperand --|> expression.
	javaOperationRightOperand --|> expression.
	javaNewClassMethodStatment --|> statement.

	"new factice"
	javaTryPartStatement --|> statement.
	javaCatchPartStatement --|> statement
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineProperties [
	super defineProperties.
	(javaFieldAccess property: #fieldName type: #String) comment: 'Name of accessed field'.
	(javaInfixOperation property: #operator type: #String) comment: 'operator s symbol'.
	(javaSeparator property: #separator type: #String) comment: 'separator'.
	(javaVarDeclStatement property: #type type: #Object) comment: 'type of declared variables'.
	(javaVariableDeclarator property: #expression type: #FASTExpression) comment: 'Expression that s being assigned upon declaration to the var'.
	(javaVariableDeclarator property: #variable type: #FASTNamedEntity) comment: 'Variable that s being declared'.
	(javaAssignementExpression property: #expression type: #FASTExpression) comment: 'Expression that s being assigned upon declaration to the var'.
	(javaAssignementExpression property: #variable type: #FASTNamedEntity) comment: 'Variable that s being assigned'.

	"new"
	(javaCastExpression property: #type type: #FASTNamedEntity) comment: 'The type in witch the expression will be cast'.
	(javaCastExpression property: #expression type: #FASTExpression) comment: 'The expression to cast'.
	(javaClassProperty property: #type type: #FASTNamedEntity) comment: 'The owner type'.
	(javaClassProperty property: #fieldName type: #String) comment: 'Name of accessed field'.
	(javaMethodInvocation property: #receiver type: #FASTExpression) comment: 'The expression whitch will execute this invocation'.
	(javaUnaryExpression property: #expression type: #FASTExpression) comment: 'The affected expression'.
	(javaUnaryExpression property: #operator type: #String) comment: 'The operator string to apply to the expression'.
	(javaUnaryExpression property: #isPrefixedUnaryExpression type: #Boolean) comment: 'true if the expression is prefixed (ex. ++i) else false'.
	(javaNewExpression property: #type type: #FASTNamedEntity) comment: 'The type of the array'.


	"Try to remove the maximum of factice entity. So we create a Property for the relation '-'/one-to-one"
	(javaForEachStatement property: #body type: #FASTStatement) comment: 'The body of the For Each statement'.
	(javaForEachStatement property: #list type: #FASTExpression) comment: 'The list the for each statement iterate on'.
	(javaForEachStatement property: #fieldname type: #FASTExpression) comment: 'The name of the created local variable'.
	(javaForEachStatement property: #type type: #FASTStatement) comment: 'The name of the type of the created local variable'.
	"try catch"
	(javaCatchPartStatement property: #body type: #FASTStatement) comment: 'The body of the Catch part statement'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineRelations [
	super defineRelations.
]

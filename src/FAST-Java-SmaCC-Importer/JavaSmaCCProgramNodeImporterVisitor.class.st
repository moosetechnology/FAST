Class {
	#name : #JavaSmaCCProgramNodeImporterVisitor,
	#superclass : #JavaProgramNodeVisitor,
	#instVars : [
		'model',
		'currentFASTEntity',
		'parentFASTVisitor'
	],
	#category : #'FAST-Java-SmaCC-Importer'
}

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> addToModel: anEntity [
	self model silentlyAdd: anEntity.
	^ anEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> clone [
	^ self class new
			model: self model ;
			parentFASTVisitor: self ; 
			yourself.
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> createExpression: aFASTExp [
	currentFASTEntity := self addToModel: aFASTExp.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> currentFASTEntity [
	^ currentFASTEntity 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> initialize [
	super initialize.
	model := FASTMooseModel new
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> model [
	^ model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> model: aModel [
	model := aModel
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTEntity [
	
	^ parentFASTVisitor currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor [
	
	^ parentFASTVisitor
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parentFASTVisitor: anObject [
	
	parentFASTVisitor := anObject
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeMethodString: aCodeString [
	| ast |
	ast := JavaParser parse: 'class Foo { ' , aCodeString , '}'.
	self visitSmaCCParseNode: ast.
	^ self model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> parseCodeString: aCodeString [
	| ast |
	ast := JavaParser parse: aCodeString.
	self visitSmaCCParseNode: ast.
	^self  model
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitAssignment: aVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaAssignementExpression new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity variable: (self clone accept: aVariableDeclaration variable).
	currentFASTEntity expression: (self clone accept: aVariableDeclaration value).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitBinaryExpression: aBinaryExpression [
	currentFASTEntity := self addToModel: FASTJavaInfixOperation new.
	currentFASTEntity
		leftOperand:
			(FASTJavaOperationLeftOperand new
				addChild: (self clone accept: aBinaryExpression leftExpression);
				yourself).
	currentFASTEntity
		rightOperand:
			(FASTJavaOperationRightOperand new
				addChild: (self clone accept: aBinaryExpression rightExpression);
				yourself).
	currentFASTEntity operator: (self clone accept: aBinaryExpression op).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitBlock: aBlock [
	currentFASTEntity := self addToModel: FASTStatementBlock new.
	currentFASTEntity parentNode: self parentFASTEntity.

	aBlock statements do: [ :each | currentFASTEntity addStatement: (self clone accept: each) ].

	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitBooleanLiteral: aBooleanLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTBooleanLiteral new
				value: aBooleanLiteral token value;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitCharacterLiteral: aCharacterLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaCharacterLiteral new
				value: aCharacterLiteral token value;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitExpressionStatement: anExpressionStatement [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity addExpression: (self clone accept: anExpressionStatement expression).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitFloatLiteral: aFloatLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaFloatLiteral new
				value: aFloatLiteral token value;
				yourself).
					currentFASTEntity parentNode: self parentFASTEntity.
					^ currentFASTEntity 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitForStatement: aForStatement [
	currentFASTEntity := self addToModel: FASTJavaForStatement new.
	currentFASTEntity
		condition:
			(FASTJavaConditionStatement new
				addChild: (self clone accept: aForStatement test);
				yourself).
	currentFASTEntity
		incrementors:
			(FASTJavaIncrementorsStatement new
				addChild: (self clone accept: aForStatement _update);
				yourself).
	currentFASTEntity
		initializers:
			(FASTJavaInitializersStatement new
				addChild: (self clone accept: aForStatement initial);
				yourself).
	currentFASTEntity
		body:
			(FASTJavaBodyStatement new
				addChild: (self clone accept: aForStatement statement);
				yourself).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitIfElseStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity
		condition:
			(FASTJavaConditionStatement new
				addChild: (self clone accept: anIfStatementNode expression);
				yourself).
	currentFASTEntity
		thenPart:
			(FASTJavaThenPartStatement new
				addChild: (self clone accept: anIfStatementNode trueStatement);
				yourself).
	anIfStatementNode falseStatement
		ifNotNil: [ currentFASTEntity
				elsePart:
					(FASTJavaElsePartStatement new
						addChild: (self clone accept: anIfStatementNode falseStatement);
						yourself) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitIfStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity
		condition:
			(FASTJavaConditionStatement new
				addChild: (self clone accept: anIfStatementNode expression);
				yourself).
	currentFASTEntity
		thenPart:
			(FASTJavaThenPartStatement new
				addChild: (self clone accept: anIfStatementNode trueStatement);
				yourself).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitIntegerLiteral: anIntegerLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaIntegerLiteral new
				value: anIntegerLiteral token value;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclaration: aLocalVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	aLocalVariableDeclaration variableDeclarations
		do: [ :each | currentFASTEntity addDeclarator: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitLocalVariableDeclarationStatement: aLocalVariableDeclarationStatement [
	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	aLocalVariableDeclarationStatement declaration variableDeclarations
		do: [ :each | currentFASTEntity addDeclarator: (self clone accept: each) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodDeclaration: aMethodDeclaration [
	currentFASTEntity := FASTJavaMethodEntity new
		name: aMethodDeclaration declarator name value;
		yourself.
	aMethodDeclaration declarator parameters
		do: [ :parameter | self clone accept: parameter ].
	currentFASTEntity statementBlock: (self clone accept: aMethodDeclaration body).
	self addToModel: currentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitMethodInvocation: aMethodInvocation [
	currentFASTEntity := self addToModel: FASTJavaMethodInvocation new.
	currentFASTEntity parentNode: self parentFASTEntity.
	aMethodInvocation expressions do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression)].
	aMethodInvocation receiver ifNotNil: [ :receiver |
		currentFASTEntity receiver: (self clone accept: receiver) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitName: aName [
	currentFASTEntity := self addToModel: FASTNamedEntity new.
	currentFASTEntity name: aName name value.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitNull: aNull [
	currentFASTEntity := self
		addToModel:
			(FASTJavaNullLiteral new
				value: aNull token value;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitParameter: aParameter [
	| param |
	param := self visitName: aParameter variable.
	self parentFASTEntity addParameter: param.
	^ param
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitPostIncrementExpression: aPostIncrementExpression [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
		currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity
		expression:
			(FASTJavaMethodInvocation new
				name: aPostIncrementExpression plusPlus value;
				addArgument: (self clone accept: aPostIncrementExpression expression);
				yourself).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitPreIncrementExpression: aPreIncrementExpression [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	currentFASTEntity expression: (FASTJavaMethodInvocation new name: aPreIncrementExpression plusPlus value; addArgument: (self clone accept: aPreIncrementExpression expression); yourself).
		currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitReturnStatement: aReturnStatement [

	currentFASTEntity := self addToModel: FASTReturnStatement new.
		currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity expression: (self clone accept: aReturnStatement expression).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitStatementExpressionList: aStatementExpressionList [
	currentFASTEntity := self addToModel: FASTExpressionStatement new.
		currentFASTEntity parentNode: self parentFASTEntity.
	aStatementExpressionList expressions do: [:expression | currentFASTEntity addExpression: (self clone accept: expression)].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitStringLiteral: aStringLiteral [
	currentFASTEntity := self
		addToModel:
			(FASTJavaStringLiteral new
				value: aStringLiteral token value;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableDeclaration: aVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
		currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity variable: (self clone accept: aVariableDeclaration variable).
	currentFASTEntity expression: (self clone accept: aVariableDeclaration initializer).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableName: aVariableName [
	^ self visitName: aVariableName 
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitWhileStatement: aWhileStatementNode [
	currentFASTEntity := self addToModel: FASTJavaWhileStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity
		condition:
			(FASTJavaConditionStatement new
				addChild: (self clone accept: aWhileStatementNode expression);
				yourself).
	currentFASTEntity
		body:
			(FASTJavaBodyStatement new
				addChild: (self clone accept: aWhileStatementNode statement);
				yourself).
	^ currentFASTEntity
]

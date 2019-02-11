Class {
	#name : #JavaSmaCCProgramNodeImporterVisitor,
	#superclass : #JavaProgramNodeVisitor,
	#instVars : [
		'model',
		'currentFASTEntity',
		'parentFASTVisitor'
	],
	#classInstVars : [
		'hello'
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
	ast := JavaParser
		parse:
			aCodeString
		startingAt:
			JavaParser
				startingStateFormethod_declaration.
	self
		accept: ast.
	^ self
		model
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
	currentFASTEntity leftOperand: (self clone accept: aBinaryExpression leftExpression).
	currentFASTEntity
		rightOperand:
			(self clone accept: aBinaryExpression rightExpression).
	currentFASTEntity operator: aBinaryExpression op value.
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
JavaSmaCCProgramNodeImporterVisitor >> visitCastExpression: aCastExpression [
	currentFASTEntity := self addToModel: FASTJavaCastExpression new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity type: (self clone accept: aCastExpression type).
	currentFASTEntity expression: (self clone accept: aCastExpression expression).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchClause: aCatchClause [
	currentFASTEntity := self addToModel: FASTJavaCatchPartStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	self clone accept: aCatchClause parameter.
	currentFASTEntity body: (self clone accept: aCatchClause block).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitCatchParameter: aCatchParameter [
	| param |
	param := self visitName: aCatchParameter variable.
	self parentFASTEntity addParameter: param.
	^ param
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
JavaSmaCCProgramNodeImporterVisitor >> visitClassProperty: aClassProperty [
	currentFASTEntity := self addToModel: FASTJavaClassProperty new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity type: (self clone accept: aClassProperty name).
	currentFASTEntity fieldName: aClassProperty thisToken value.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitClassType: aClassType [
	currentFASTEntity := self addToModel: FASTNamedEntity new.
	currentFASTEntity name: aClassType name name value.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitEmptyStatement: anEmptyStatement [
	currentFASTEntity := self addToModel: FASTStatement new.
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
JavaSmaCCProgramNodeImporterVisitor >> visitFieldAccess: aFieldAccess [ 
	currentFASTEntity := self addToModel: FASTJavaFieldAccess new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity fieldName: aFieldAccess name value.
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
JavaSmaCCProgramNodeImporterVisitor >> visitForEachStatement: aForEachStatement [
	currentFASTEntity := self addToModel: FASTJavaForEachStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity body: (self clone accept: aForEachStatement statement).
	currentFASTEntity fieldname: (self clone accept: aForEachStatement name).
	currentFASTEntity type: (self clone accept: aForEachStatement type).
	currentFASTEntity list: (self clone accept: aForEachStatement expression).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitForStatement: aForStatement [
	currentFASTEntity := self addToModel: FASTJavaForStatement new.
	currentFASTEntity condition: (self clone accept: aForStatement test).
	currentFASTEntity incrementors: (self clone accept: aForStatement _update).
	currentFASTEntity
		initializers:(self clone accept: aForStatement initial).
	currentFASTEntity body: (self clone accept: aForStatement statement).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitIfElseStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity thenPart: (self clone accept: anIfStatementNode trueStatement).
	anIfStatementNode falseStatement
		ifNotNil: [ currentFASTEntity
				elsePart: (self clone accept: anIfStatementNode falseStatement) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitIfStatement: anIfStatementNode [
	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity condition: (self clone accept: anIfStatementNode expression).
	currentFASTEntity
		thenPart: (self clone accept: anIfStatementNode trueStatement).
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitInitializedVariableDeclaration: anInitializedVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity variable: (self clone accept: anInitializedVariableDeclaration variable).
	currentFASTEntity expression: (self clone accept: anInitializedVariableDeclaration initializer).
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
	aMethodInvocation expressions do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression) ].
	aMethodInvocation receiver
		ifNotNil: [ :receiver | 
			(receiver isMemberOf: JavaNameNode)
				ifTrue: [ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer"
					currentFASTEntity
						receiver:
							(FASTJavaIdentifier new
								name: receiver name value;
								parentNode: currentFASTEntity; 
								yourself).
					self addToModel: currentFASTEntity receiver  ]
				ifFalse: [ currentFASTEntity receiver: (self clone accept: receiver) ] ].
	currentFASTEntity name: aMethodInvocation name value.
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
JavaSmaCCProgramNodeImporterVisitor >> visitNew: aNewNode [
	currentFASTEntity := self addToModel: FASTJavaNewExpression new.
	currentFASTEntity parentNode: self parentFASTEntity.
	aNewNode expressions
		do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression) ].
	currentFASTEntity name: aNewNode type name name value.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitNewClass: aNewClass [
	currentFASTEntity := self addToModel: FASTJavaNewClassExpression new.
	currentFASTEntity parentNode: self parentFASTEntity.
	aNewClass expressions
		do: [ :expression | currentFASTEntity addArgument: (self clone accept: expression) ].
	currentFASTEntity name: aNewClass type name name value.
	aNewClass declarations do: [:method | currentFASTEntity addMethod: (self clone accept: method) ]. 
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
JavaSmaCCProgramNodeImporterVisitor >> visitPostDecrementExpression: aPostDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: aPostDecrementExpression expression).
	currentFASTEntity operator: aPostDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitPostIncrementExpression: aPostIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: aPostIncrementExpression expression).
	currentFASTEntity operator: aPostIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: false.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitPreDecrementExpression: aPreDecrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: aPreDecrementExpression expression).
	currentFASTEntity operator: aPreDecrementExpression minusMinus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitPreIncrementExpression: aPreIncrementExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: aPreIncrementExpression expression).
	currentFASTEntity operator: aPreIncrementExpression plusPlus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitQualifiedName: aQualifiedName [
	currentFASTEntity := self addToModel: FASTJavaClassProperty new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity type: (self clone accept: aQualifiedName nspace).
	currentFASTEntity fieldName: aQualifiedName name value.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitReturnStatement: aReturnStatement [
	currentFASTEntity := self addToModel: FASTReturnStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	
			(aReturnStatement expression isKindOf: JavaNameNode)
				ifTrue: [ "If the element is named. It is more than propably an Identifier and not just an named element. So you pass over the normal rules of the importer"
					currentFASTEntity
						expression:
							(FASTJavaIdentifier new
								name: aReturnStatement expression name value;
								yourself) ]
				ifFalse: [ aReturnStatement expression ifNotNil: [ :expression | currentFASTEntity expression: (self clone accept: expression) ] ].
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
				value: (((aStringLiteral token value) removePrefix: '"') removeSuffix: '"') ;
				yourself).
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitTryStatement: aTryStatement [
	currentFASTEntity := self addToModel: FASTJavaTryCatchStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity
		try: (self clone accept: aTryStatement block).
	aTryStatement catches do: [ :aCatchBlock | currentFASTEntity addCatch: (self clone accept: aCatchBlock) ].
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryAddition: anUnaryAddition [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: anUnaryAddition expression).
	currentFASTEntity operator: anUnaryAddition plus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryBitInvert: anUnaryBitInvert [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: anUnaryBitInvert expression).
	currentFASTEntity operator: anUnaryBitInvert tilde value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitUnaryNot: aUnaryNotExpression [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: aUnaryNotExpression expression).
	currentFASTEntity operator: aUnaryNotExpression bang value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitUnarySubtraction: anUnarySubtraction [
	currentFASTEntity := self addToModel: FASTJavaUnaryExpression new.
	currentFASTEntity expression: (self clone accept: anUnarySubtraction expression).
	currentFASTEntity operator: anUnarySubtraction minus value.
	currentFASTEntity isPrefixedUnaryExpression: true.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #initialization }
JavaSmaCCProgramNodeImporterVisitor >> visitVariableDeclaration: aVariableDeclaration [
	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
		currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity variable: (self clone accept: aVariableDeclaration variable).
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
	currentFASTEntity condition: (self clone accept: aWhileStatementNode expression).
	currentFASTEntity
		body: (self clone accept: aWhileStatementNode statement).
	^ currentFASTEntity
]

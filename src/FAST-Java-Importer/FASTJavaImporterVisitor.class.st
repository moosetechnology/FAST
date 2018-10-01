"
FAST visitor for PetitJava AST

should create Trait FASTImporterVisitor to factorize some of the methods
"
Class {
	#name : #FASTJavaImporterVisitor,
	#superclass : #PJASTNodeVisitor,
	#traits : 'TFASTImporterVisitor',
	#classTraits : 'TFASTImporterVisitor classTrait',
	#instVars : [
		'model',
		'parentFASTVisitor',
		'currentFASTEntity',
		'currentFASTScope',
		'famixPoolOfVariable'
	],
	#category : #'FAST-Java-Importer'
}

{ #category : #'instance-creation' }
FASTJavaImporterVisitor class >> newWithModel: aModel [

		^ self new initializeWithModel: aModel
]

{ #category : #parsing }
FASTJavaImporterVisitor >> clone [
	^ self class new
			model: self model ;
			currentFASTScope: self currentFASTScope ;
			famixPoolOfVariable: self famixPoolOfVariable ;
			parentFASTVisitor: self ; 
			yourself.
			
]

{ #category : #adding }
FASTJavaImporterVisitor >> createExpression: aFASTExp [
	currentFASTEntity := self addToModel: aFASTExp.
	currentFASTEntity parentNode: self parentFASTEntity.
	^ currentFASTEntity
]

{ #category : #adding }
FASTJavaImporterVisitor >> createLiteral: aFASTLiteral withValue: aValue [

	self createExpression: aFASTLiteral.
	currentFASTEntity value: aValue.

	^ currentFASTEntity
]

{ #category : #adding }
FASTJavaImporterVisitor >> createVariable: aVariableNode [ 
 	| fastVar |
	fastVar := self addToModel: FASTNamedEntity new.
	fastVar name: aVariableNode name.
	fastVar parentNode: currentFASTEntity.
	^ fastVar

]

{ #category : #accessing }
FASTJavaImporterVisitor >> currentFASTEntity [
	
	^ currentFASTEntity
]

{ #category : #accessing }
FASTJavaImporterVisitor >> currentFASTEntity: anObject [
	
	currentFASTEntity := anObject
]

{ #category : #accessing }
FASTJavaImporterVisitor >> currentFASTScope [
	
	^ currentFASTScope
]

{ #category : #accessing }
FASTJavaImporterVisitor >> currentFASTScope: anObject [
	
	currentFASTScope := anObject
]

{ #category : #accessing }
FASTJavaImporterVisitor >> famixPoolOfVariable [
	
	^ famixPoolOfVariable
]

{ #category : #accessing }
FASTJavaImporterVisitor >> famixPoolOfVariable: anObject [
	
	famixPoolOfVariable := anObject
]

{ #category : #'initialize-release' }
FASTJavaImporterVisitor >> initializeWithModel: aModel [
	self initialize.
	model := aModel
]

{ #category : #accessing }
FASTJavaImporterVisitor >> model [
	
	^ model
]

{ #category : #accessing }
FASTJavaImporterVisitor >> model: anObject [
	
	model := anObject
]

{ #category : #accessing }
FASTJavaImporterVisitor >> parentFASTEntity [
	
	^ parentFASTVisitor currentFASTEntity
]

{ #category : #accessing }
FASTJavaImporterVisitor >> parentFASTVisitor [
	
	^ parentFASTVisitor
]

{ #category : #accessing }
FASTJavaImporterVisitor >> parentFASTVisitor: anObject [
	
	parentFASTVisitor := anObject
]

{ #category : #accessing }
FASTJavaImporterVisitor >> parentScope [
	
	^ parentFASTVisitor currentFASTScope
]

{ #category : #parsing }
FASTJavaImporterVisitor >> parser [
	"ruturn a parser that should be used to parse source into tree"
	^ PPJavaParser
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> putVarInScope: fastVar [
	"if the FASTVariable is found in the pool of famix variables:
	 - put it in the scope's dictionnary
	 - link it to the FAST variable
	 - and remove it from the pool"
	^ famixPoolOfVariable
			detect: [ :v | v name = fastVar name ]
			ifOne: [ :famixVar | 
				currentFASTScope add: famixVar.
				fastVar famixNamedEntity: famixVar.
				famixPoolOfVariable remove: famixVar ]
			ifNone: [ nil ]	
]

{ #category : #parsing }
FASTJavaImporterVisitor >> runWithSource: sourceAsString and: aFamixMethod [
	| parseTree |
	currentFASTEntity := FASTJavaMethodEntity new
									name: aFamixMethod name;
									famixNamedEntity: aFamixMethod ;
									yourself.
	aFamixMethod fastBehaviouralEntity: currentFASTEntity.

	self addToModel: currentFASTEntity.

	parseTree := self parseTreeForSource: sourceAsString. 
	parseTree ifNotNil: [self visitMethodDeclarationNode: parseTree].

	^ currentFASTEntity 
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitBooleanLiteralNode: literalNode [
	^ self createLiteral: FASTBooleanLiteral new withValue: literalNode booleanValue
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitCharacterLiteralNode: literalNode [
	^ self createLiteral: FASTJavaCharacterLiteral new withValue: literalNode literalValue first
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitExpressionStatementNode: aStatementNode [

	currentFASTEntity := self addToModel: FASTExpressionStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity expression: (self clone visitNode: aStatementNode expression).
	^ currentFASTEntity
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitFloatLiteralNode: literalNode [
	^ self createLiteral: FASTJavaFloatLiteral new withValue: literalNode literalValue

]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitIdentifierNode: anIdentifierNode [
	self createExpression: FASTJavaIdentifier new.
	currentFASTEntity name: anIdentifierNode name.
	^ currentFASTEntity
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitIfStatementNode:  anIfStatementNode [

	currentFASTEntity := self addToModel: FASTJavaIfStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.

	currentFASTEntity condition: (self clone visitNode: anIfStatementNode condition).
	currentFASTEntity thenPart: (self clone visitNode: anIfStatementNode thenPart).
	anIfStatementNode elsePart ifNotNil: [ 
		currentFASTEntity elsePart: (self clone visitNode: anIfStatementNode elsePart) ].
	
	^ currentFASTEntity
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitInfixOperationNode: anInfixOperationNode [

	self createExpression: FASTJavaInfixOperation new.
	
	currentFASTEntity leftOperand:  (self clone visitNode: anInfixOperationNode left).
	currentFASTEntity rightOperand: (self clone visitNode: anInfixOperationNode right).
	currentFASTEntity operator: anInfixOperationNode operator.
	^ currentFASTEntity
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitIntegerLiteralNode: literalNode [
	^ self createLiteral: FASTJavaIntegerLiteral new withValue: literalNode literalValue

]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitLocalVariableDeclarationStatementNode: aLocalVariableDeclarationStatementNode [

	currentFASTEntity := self addToModel: FASTJavaVarDeclStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	
	aLocalVariableDeclarationStatementNode declarators do: [ :each | self clone visitNode: each ].
	^ currentFASTEntity
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitMethodDeclarationNode: aMethodDeclarationNode [
	"famixPoolOfVariable := OrderedCollection withAll: currentFASTEntity famixNamedEntity localVariables."
	currentFASTEntity statementBlock: (self clone visitNode: aMethodDeclarationNode body).
		"Note: famixPoolOfVariable should be empty here"
	"self assert: [ famixPoolOfVariable isEmpty ]."

	^ currentFASTEntity
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitNullLiteralNode: literalNode [
	^ self createLiteral: FASTJavaNullLiteral new withValue: literalNode literalValue

]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitParameterDeclaratorNode: aParameterDeclaratorNode [
	"creates a parameter with the proper name
	 adds it to the FAST method's list of parameters
	 links it with the corresponding Famix Parameter
	 and removes it from the pool of famix variable for this method"

	| fastVar |
	fastVar := self createVariable: aParameterDeclaratorNode identifier.
	self parentFASTEntity parameters add: fastVar.	
	self putVarInScope: fastVar.

	^ fastVar
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitReturnStatementNode: aReturnStatementNode [

	currentFASTEntity := self addToModel: FASTReturnStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.
	currentFASTEntity expression: (self clone visitNode: aReturnStatementNode expression).
	^ currentFASTEntity
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitSeparatorNode: literalNode [
	| literal |
	self flag: 'NA -- don''t know what this is ?'.
	Halt now.
	literal := self addToModel: FASTJavaSeparator new.
	^ literal
		value: literalNode separatorValue;
		yourself
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitStatementBlockNode: aBodyNode [
	currentFASTEntity := (self addToModel: FASTStatementBlock new).
	currentFASTEntity parentNode: self parentFASTEntity.

	aBodyNode statements do: [:each |
		currentFASTEntity statements add: (self clone visitNode: each)].
	
	^ currentFASTEntity
]

{ #category : #'visitor-literal doubleDispatching' }
FASTJavaImporterVisitor >> visitStringLiteralNode: literalNode [
	^ self createLiteral: FASTJavaStringLiteral new withValue: literalNode literalValue.

]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitVariableDeclaratorNode: aVariableDeclaratorNode [

	currentFASTEntity := self addToModel: FASTJavaVariableDeclarator new.
	currentFASTEntity	variable: (self createVariable: aVariableDeclaratorNode variable).
	self parentFASTEntity addDeclarator: currentFASTEntity.	
	currentFASTEntity expression: (self clone visitNode: aVariableDeclaratorNode initializer).
	^ currentFASTEntity
]

{ #category : #'visitor-doubleDispatching' }
FASTJavaImporterVisitor >> visitWhileStatementNode:  aWhileStatementNode [

	currentFASTEntity := self addToModel: FASTJavaWhileStatement new.
	currentFASTEntity parentNode: self parentFASTEntity.

	currentFASTEntity condition: (self clone visitNode: aWhileStatementNode expression).	
	currentFASTEntity body: (self clone visitNode: aWhileStatementNode statement).
	
	^ currentFASTEntity
]

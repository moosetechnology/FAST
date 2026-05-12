"
I am a visitor for FASTEntities. 
I am generated with the metamodel.
"
Trait {
	#name : 'FASTTVisitor',
	#traits : 'FamixTVisitor',
	#classTraits : 'FamixTVisitor classTrait',
	#category : 'FAST-Core-Visitor-Visitor',
	#package : 'FAST-Core-Visitor',
	#tag : 'Visitor'
}

{ #category : 'meta' }
FASTTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTEntity: aFASTEntity [

	<generated>
	self visitFASTTEntity: aFASTEntity
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTAssignment: aFASTTAssignment [

	<generated>
	self visitFASTTExpression: aFASTTAssignment.

	self visitEntity: aFASTTAssignment expression.
	self visitEntity: aFASTTAssignment variable
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTBehaviouralEntity: aFASTTBehaviouralEntity [

	<generated>
	self visitFASTTScopableEntity: aFASTTBehaviouralEntity.
	self visitFASTTWithParameters: aFASTTBehaviouralEntity.
	self visitFASTTWithStatements: aFASTTBehaviouralEntity
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTBinaryExpression: aFASTTBinaryExpression [

	<generated>
	self visitFASTTExpression: aFASTTBinaryExpression.

	self visitEntity: aFASTTBinaryExpression leftOperand.
	self visitEntity: aFASTTBinaryExpression rightOperand
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTBooleanLiteral: aFASTTBooleanLiteral [

	<generated>
	self visitFASTTLiteral: aFASTTBooleanLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTCharacterLiteral: aFASTTCharacterLiteral [

	<generated>
	self visitFASTTLiteral: aFASTTCharacterLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTComment: aFASTTComment [

	<generated>
	self visitEntity: aFASTTComment container
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTConditionalStatement: aFASTTConditionalStatement [

	<generated>
	self visitFASTTStatement: aFASTTConditionalStatement.
	self visitFASTTWithCondition: aFASTTConditionalStatement
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTEntity: aFASTTEntity [

	<generated>
	self visitTEntityMetaLevelDependency: aFASTTEntity
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTExpression: aFASTTExpression [

	<generated>
	self visitFASTTEntity: aFASTTExpression.

	self visitEntity: aFASTTExpression assignedIn.
	self visitEntity: aFASTTExpression parentExpressionLeft.
	self visitEntity: aFASTTExpression parentExpressionRight.
	self visitEntity: aFASTTExpression parentConditional.
	self visitEntity: aFASTTExpression expressionStatementOwner.
	self visitEntity: aFASTTExpression returnOwner.
	self visitEntity: aFASTTExpression parentExpression.
	self visitEntity: aFASTTExpression argumentOwner
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTExpressionStatement: aFASTTExpressionStatement [

	<generated>
	self visitFASTTStatement: aFASTTExpressionStatement.

	self visitEntity: aFASTTExpressionStatement expression
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTInvocation: aFASTTInvocation [

	<generated>
	self visitFASTTExpression: aFASTTInvocation.
	self visitFASTTWithArguments: aFASTTInvocation.

	self visitEntity: aFASTTInvocation invoked
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTLiteral: aFASTTLiteral [

	<generated>
	self visitFASTTExpression: aFASTTLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTLoopStatement: aFASTTLoopStatement [

	<generated>
	self visitFASTTStatement: aFASTTLoopStatement.

	self visitEntity: aFASTTLoopStatement body
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTNamedBehaviouralEntity: aFASTTNamedBehaviouralEntity [

	<generated>
	self visitFASTTBehaviouralEntity: aFASTTNamedBehaviouralEntity.
	self visitFASTTNamedEntity: aFASTTNamedBehaviouralEntity
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTNamedEntity: aFASTTNamedEntity [

	<generated>
	self visitFASTTEntity: aFASTTNamedEntity.

	self visitEntity: aFASTTNamedEntity invokedIn
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTNullPointerLiteral: aFASTTNullPointerLiteral [

	<generated>
	self visitFASTTLiteral: aFASTTNullPointerLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTNumericalLiteral: aFASTTNumericalLiteral [

	<generated>
	self visitFASTTLiteral: aFASTTNumericalLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTReturnStatement: aFASTTReturnStatement [

	<generated>
	self visitFASTTStatement: aFASTTReturnStatement.

	self visitEntity: aFASTTReturnStatement expression
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTScopableEntity: aFASTTScopableEntity [

	<generated>
	self visitFASTTEntity: aFASTTScopableEntity
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTStatement: aFASTTStatement [

	<generated>
	self visitFASTTEntity: aFASTTStatement.

	self visitEntity: aFASTTStatement parentLoopStatement.
	self visitEntity: aFASTTStatement statementContainer
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTStatementBlock: aFASTTStatementBlock [

	<generated>
	self visitFASTTStatement: aFASTTStatementBlock.

	self visitCollection: aFASTTStatementBlock statements.
	self visitEntity: aFASTTStatementBlock fastBehaviouralParent
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTStringLiteral: aFASTTStringLiteral [

	<generated>
	self visitFASTTLiteral: aFASTTStringLiteral
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTUnaryExpression: aFASTTUnaryExpression [

	<generated>
	self visitFASTTExpression: aFASTTUnaryExpression.

	self visitEntity: aFASTTUnaryExpression expression
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTVariableEntity: aFASTTVariableEntity [

	<generated>
	self visitFASTTNamedEntity: aFASTTVariableEntity.

	self visitEntity: aFASTTVariableEntity parentAssignmentExpression.
	self visitEntity: aFASTTVariableEntity parameterOwner
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTVariableExpression: aFASTTVariableExpression [

	<generated>
	self visitFASTTExpression: aFASTTVariableExpression.
	self visitFASTTNamedEntity: aFASTTVariableExpression
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTWithArguments: aFASTTWithArguments [

	<generated>
	self visitCollection: aFASTTWithArguments arguments
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTWithComments: aFASTTWithComments [

	<generated>
	self visitCollection: aFASTTWithComments comments
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTWithCondition: aFASTTWithCondition [

	<generated>
	self visitEntity: aFASTTWithCondition condition
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTWithParameters: aFASTTWithParameters [

	<generated>
	self visitCollection: aFASTTWithParameters parameters
]

{ #category : 'visiting' }
FASTTVisitor >> visitFASTTWithStatements: aFASTTWithStatements [

	<generated>
	self visitEntity: aFASTTWithStatements statementBlock
]

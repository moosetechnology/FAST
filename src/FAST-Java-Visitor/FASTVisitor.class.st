Class {
	#name : #FASTVisitor,
	#superclass : #Object,
	#category : #'FAST-Java-Visitor'
}

{ #category : #visitor }
FASTVisitor >> accept: aFASTEntity [ 
	^ aFASTEntity accept: self
]

{ #category : #generated }
FASTVisitor >> visitFASTBehaviouralEntity: aFASTBehaviouralEntity [
	^ self visitFASTScopableEntity: aFASTBehaviouralEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTBooleanLiteral: aFASTBooleanLiteral [
	^ self visitFASTLiteral: aFASTBooleanLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTCharacterLiteral: aFASTCharacterLiteral [
	^ self visitFASTLiteral: aFASTCharacterLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTEntity: aFASTEntity [
	^ self subclassResponsibility
]

{ #category : #generated }
FASTVisitor >> visitFASTExpression: aFASTExpression [
	^ self visitFASTEntity: aFASTExpression
]

{ #category : #generated }
FASTVisitor >> visitFASTExpressionStatement: aFASTExpressionStatement [
	^ self visitFASTStatement: aFASTExpressionStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ self visitFASTExpression: aFASTJavaAssignementExpression
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaBodyStatement: aFASTJavaBodyStatement [
	^ self visitFASTStatement: aFASTJavaBodyStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [
	^ self visitFASTStatement: aFASTJavaBreakStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [
	^ self visitFASTStatement: aFASTJavaCaseStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ self visitFASTExpression: aFASTJavaCastExpression
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ self visitFASTStatement: aFASTJavaCatchPartStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	^ self visitFASTCharacterLiteral: aFASTJavaCharacterLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ self visitFASTExpression: aFASTJavaClassProperty
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ self visitFASTStatement: aFASTJavaConditionStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	^ self visitFASTStatement: aFASTJavaContinueStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaDoStatement: aFASTJavaDoStatement [
	^ self visitFASTStatement: aFASTJavaDoStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ self visitFASTStatement: aFASTJavaElsePartStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	^ self visitFASTExpression: aFASTJavaFieldAccess
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	^ self visitFASTLiteral: aFASTJavaFloatLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	^ self visitFASTStatement: aFASTJavaForEachStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	^ self visitFASTStatement: aFASTJavaForStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ self visitFASTVariableExpression: aFASTJavaIdentifier
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	^ self visitFASTStatement: aFASTJavaIfStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaIncrementorsStatement: aFASTJavaIncrementorsStatement [
	^ self visitFASTStatement: aFASTJavaIncrementorsStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ self visitFASTExpression: aFASTJavaInfixOperation
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaInitializersStatement: aFASTJavaInitializersStatement [
	^ self visitFASTStatement: aFASTJavaInitializersStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaIntegerLiteral: aFASTJavaIntegerLiteral [
	^ self visitFASTLiteral: aFASTJavaIntegerLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ self visitFASTNamedBehaviouralEntity: aFASTJavaMethodEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^ self visitFASTExpression: aFASTJavaMethodInvocation
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ self visitFASTNullPointerLiteral: aFASTJavaNullLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ self visitFASTExpression: aFASTJavaOperationLeftOperand
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [
	^ self visitFASTExpression: aFASTJavaOperationRightOperand
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaSeparator: aFASTJavaSeparator [
	^ self visitFASTVariableExpression: aFASTJavaSeparator
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ self visitFASTStringLiteral: aFASTJavaStringLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [
	^ self visitFASTStatement: aFASTJavaSwitchStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ self visitFASTStatement: aFASTJavaThenPartStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaThis: aFASTJavaThis [
	^ self visitFASTVariableExpression: aFASTJavaThis
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ self visitFASTStatement: aFASTJavaTryCatchStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ self visitFASTStatement: aFASTJavaTryPartStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ self visitFASTStatement: aFASTJavaVarDeclStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	^ self visitFASTEntity: aFASTJavaVariableDeclarator
]

{ #category : #generated }
FASTVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ self visitFASTStatement: aFASTJavaWhileStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTLiteral: aFASTLiteral [
	^ self visitFASTExpression: aFASTLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTNamedBehaviouralEntity: aFASTNamedBehaviouralEntity [
	^ self visitFASTBehaviouralEntity: aFASTNamedBehaviouralEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTNamedEntity: aFASTNamedEntity [
	^ self visitFASTEntity: aFASTNamedEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTNullPointerLiteral: aFASTNullPointerLiteral [
	^ self visitFASTLiteral: aFASTNullPointerLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTReturnStatement: aFASTReturnStatement [
	^ self visitFASTStatement: aFASTReturnStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTScopableEntity: aFASTScopableEntity [
	^ self visitFASTEntity: aFASTScopableEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTStatement: aFASTStatement [
	^ self visitFASTScopableEntity: aFASTStatement
]

{ #category : #generated }
FASTVisitor >> visitFASTStatementBlock: aFASTStatementBlock [
	^ self visitFASTStatement: aFASTStatementBlock
]

{ #category : #generated }
FASTVisitor >> visitFASTStringLiteral: aFASTStringLiteral [
	^ self visitFASTLiteral: aFASTStringLiteral
]

{ #category : #generated }
FASTVisitor >> visitFASTVariableEntity: aFASTVariableEntity [
	^ self visitFASTEntity: aFASTVariableEntity
]

{ #category : #generated }
FASTVisitor >> visitFASTVariableExpression: aFASTVariableExpression [
	^ self visitFASTExpression: aFASTVariableExpression
]

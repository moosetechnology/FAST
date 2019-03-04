Class {
	#name : #FASTCoreVisitor,
	#superclass : #Object,
	#category : #'FAST-Core-Visitor'
}

{ #category : #generated }
FASTCoreVisitor >> visitFASTAssociation: aFASTAssociation [
	^ self visitFASTSourcedEntity: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTBehaviouralEntity: aFASTBehaviouralEntity [
	^ self visitFASTScopableEntity: aFASTBehaviouralEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTBooleanLiteral: aFASTBooleanLiteral [
	^ self visitFASTLiteral: aFASTBooleanLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTCharacterLiteral: aFASTCharacterLiteral [
	^ self visitFASTLiteral: aFASTCharacterLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTComment: aFASTComment [
	^ self visitFASTSourcedEntity: aFASTComment
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTEntity: aFASTEntity [
	^ self subclassResponsibility
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTEntitySourceAnchor: aFASTEntitySourceAnchor [
	^ self visitFASTEntity: aFASTEntitySourceAnchor
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTExpression: aFASTExpression [
	^ self visitFASTEntitySourceAnchor: aFASTExpression
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTExpressionStatement: aFASTExpressionStatement [
	^ self visitFASTStatement: aFASTExpressionStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTLiteral: aFASTLiteral [
	^ self visitFASTExpression: aFASTLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTNamedBehaviouralEntity: aFASTNamedBehaviouralEntity [
	^ self visitFASTBehaviouralEntity: aFASTNamedBehaviouralEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTNamedEntity: aFASTNamedEntity [
	^ self visitFASTEntitySourceAnchor: aFASTNamedEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTNullPointerLiteral: aFASTNullPointerLiteral [
	^ self visitFASTLiteral: aFASTNullPointerLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTReturnStatement: aFASTReturnStatement [
	^ self visitFASTStatement: aFASTReturnStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTScopableEntity: aFASTScopableEntity [
	^ self visitFASTEntitySourceAnchor: aFASTScopableEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTSourceAnchor: aFASTSourceAnchor [
	^ self visitFASTEntity: aFASTSourceAnchor
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTSourceLanguage: aFASTSourceLanguage [
	^ self visitFASTEntity: aFASTSourceLanguage
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTSourceTextAnchor: aFASTSourceTextAnchor [
	^ self visitFASTSourceAnchor: aFASTSourceTextAnchor
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTSourcedEntity: aFASTSourcedEntity [
	^ self visitFASTEntity: aFASTSourcedEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTStatement: aFASTStatement [
	^ self visitFASTScopableEntity: aFASTStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTStatementBlock: aFASTStatementBlock [
	^ self visitFASTStatement: aFASTStatementBlock
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTStringLiteral: aFASTStringLiteral [
	^ self visitFASTLiteral: aFASTStringLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTVariableEntity: aFASTVariableEntity [
	^ self visitFASTEntitySourceAnchor: aFASTVariableEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTVariableExpression: aFASTVariableExpression [
	^ self visitFASTExpression: aFASTVariableExpression
]

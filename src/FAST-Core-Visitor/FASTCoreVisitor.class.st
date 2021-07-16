Class {
	#name : #FASTCoreVisitor,
	#superclass : #Object,
	#category : #'FAST-Core-Visitor'
}

{ #category : #generated }
FASTCoreVisitor >> accept: aFASTEntity [
	^ aFASTEntity accept: self
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTAssociation: aFASTAssociation [
	^ self visitFASTSourcedEntity: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTComment: aFASTComment [
	^ self visitFASTSourcedEntity: aFASTComment
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTEntity: aFASTEntity [
	^ aFASTEntity children do: [ :child | child accept: self ]
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTEntitySourceAnchor: aFASTEntitySourceAnchor [
	^ self visitFASTEntity: aFASTEntitySourceAnchor
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
FASTCoreVisitor >> visitFASTTBehaviouralEntity: aFASTBehaviouralEntity [
	^ self visitFASTTScopableEntity: aFASTBehaviouralEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTBooleanLiteral: aFASTBooleanLiteral [
	^ self visitFASTTLiteral: aFASTBooleanLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTCharacterLiteral: aFASTCharacterLiteral [
	^ self visitFASTTLiteral: aFASTCharacterLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTEntity: aFASTEntity [
	^ aFASTEntity children do: [ :child | child accept: self ]
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTExpression: aFASTExpression [
	^ self visitFASTEntity: aFASTExpression
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTExpressionStatement: aFASTExpressionStatement [
	^ self visitFASTTStatement: aFASTExpressionStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTInvocation: aFASTAssociation [
	^ self visitFASTTExpression: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTLiteral: aFASTLiteral [
	^ self visitFASTTExpression: aFASTLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTNamedBehaviouralEntity: aFASTNamedBehaviouralEntity [
	^ self visitFASTTBehaviouralEntity: aFASTNamedBehaviouralEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTNamedEntity: aFASTAssociation [
	^ self visitFASTTEntity: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTNilLiteral: aFASTNullPointerLiteral [
	^ self visitFASTTLiteral: aFASTNullPointerLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTNullPointerLiteral: aFASTAssociation [
	^ self visitFASTTLiteral: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTNumericalLiteral: aFASTAssociation [
	^ self visitFASTTLiteral: aFASTAssociation
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTReturnStatement: aFASTReturnStatement [
	^ self visitFASTTStatement: aFASTReturnStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTScopableEntity: aFASTScopableEntity [
	^ self visitFASTEntity: aFASTScopableEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTStatement: aFASTStatement [
	^ self visitFASTTScopableEntity: aFASTStatement
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTStatementBlock: aFASTStatementBlock [
	^ self visitFASTTStatement: aFASTStatementBlock
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTStringLiteral: aFASTStringLiteral [
	^ self visitFASTTLiteral: aFASTStringLiteral
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTVariableEntity: aFASTVariableEntity [
	^ self visitFASTEntity: aFASTVariableEntity
]

{ #category : #generated }
FASTCoreVisitor >> visitFASTTVariableExpression: aFASTVariableExpression [
	^ self visitFASTTExpression: aFASTVariableExpression
]

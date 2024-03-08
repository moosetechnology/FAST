"
A FASTVisitor that links local variables (structuralEntities) used to their local declaration.

This class is intended to be subclassed for each FAST, language dependant, meta-model.

- In the declaration nodes, `#localUses` lists all referencing nodes
- In the referencing nodes, `#localDeclaration` lists the corresponding declaration node or a FASTNonLocalDeclaration if the declaration node could not be found

Invoking:
```
FASTLocalResolverVisitor new on: aFASTJavaMethodEntity
```
"
Class {
	#name : #FASTLocalResolverVisitor,
	#superclass : #FASTCoreVisitor,
	#instVars : [
		'scoper'
	],
	#category : #'FAST-Core-Tools-Resolver'
}

{ #category : #initialization }
FASTLocalResolverVisitor >> initialize [ 
	super initialize.

	scoper := FASTLocalResolverScoping new
]

{ #category : #api }
FASTLocalResolverVisitor >> on: aFASTBehaviouralEntity [

	aFASTBehaviouralEntity accept: self
]

{ #category : #visiting }
FASTLocalResolverVisitor >> visitFASTIdentifierExpression: aFASTIdentifier [
	"reference to an identifier in the AST that must be bound to its declaration"

	scoper bind: aFASTIdentifier toLocalDeclaration: aFASTIdentifier name

]

{ #category : #visiting }
FASTLocalResolverVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	scoper pushScope.

	"visit order is important to ensure declarations are visited before statements"
	(aFASTJavaStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	^scoper popScope
]

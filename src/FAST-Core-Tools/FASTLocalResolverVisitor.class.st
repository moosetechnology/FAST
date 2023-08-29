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
		'scopes'
	],
	#category : #'FAST-Core-Tools-Resolver'
}

{ #category : #accessing }
FASTLocalResolverVisitor >> currentScope [

	^ scopes top
]

{ #category : #private }
FASTLocalResolverVisitor >> findDeclaration: aName [
	^self currentScope
		at: aName
		ifAbsent: [ |scope decl|
			scope := self popScope.
			self hasScopes
				ifTrue: [ decl := self findDeclaration: aName ].
			self pushScope: scope.
			decl
		]
]

{ #category : #accessing }
FASTLocalResolverVisitor >> hasScopes [
	^scopes isNotEmpty
]

{ #category : #initialization }
FASTLocalResolverVisitor >> initialize [ 
	super initialize.

	scopes := Stack new
]

{ #category : #private }
FASTLocalResolverVisitor >> localDeclaration: declarationNode for: referingNode [
	referingNode localDeclaration: declarationNode.
	declarationNode addLocalUse: referingNode
]

{ #category : #private }
FASTLocalResolverVisitor >> nonLocalDeclaration: referingNode withName: name [
	self localDeclaration: (self scopeAddNonLocalDeclaration: name) for: referingNode

]

{ #category : #api }
FASTLocalResolverVisitor >> on: aFASTBehaviouralEntity [

	self resetScopes.
	aFASTBehaviouralEntity accept: self
]

{ #category : #accessing }
FASTLocalResolverVisitor >> popScope [

	^scopes pop
]

{ #category : #accessing }
FASTLocalResolverVisitor >> pushScope [

	self pushScope: Dictionary new
]

{ #category : #accessing }
FASTLocalResolverVisitor >> pushScope: aScope [

	scopes push: aScope
]

{ #category : #accessing }
FASTLocalResolverVisitor >> resetScopes [

	scopes := Stack new.
	"first scope for the method"
	self pushScope
]

{ #category : #private }
FASTLocalResolverVisitor >> scopeAdd: aName declaration: aFASTNode [

	self currentScope
		at: aName
		ifPresent: [ DuplicatedVariableError signal:
			'local variable ' , aName , 'already found in this scope' ]
		ifAbsent: [
			aFASTNode resetLocalUses.
			self currentScope at: aName put: aFASTNode
		].
	
]

{ #category : #private }
FASTLocalResolverVisitor >> scopeAddNonLocalDeclaration: name [
	"makes a non-local declaration kind of local by adding
	 a FASTNonLocalDeclaration into the current scope"

	| currentScope nonLocalDeclaration |
	currentScope := self popScope.
	scopes
		ifEmpty: [
			self pushScope: currentScope.
			nonLocalDeclaration := FASTNonLocalDeclaration new name: name.
			self
				scopeAdd: name
				declaration: nonLocalDeclaration
			]
		ifNotEmpty: [
			nonLocalDeclaration := self scopeAddNonLocalDeclaration: name.
			self pushScope: currentScope.
		].
	^nonLocalDeclaration 
		
]

{ #category : #visiting }
FASTLocalResolverVisitor >> visitFASTIdentifierExpression: aFASTIdentifier [
	"reference to an identifier in the AST
	 - the identifier refers to a variable (structuralEntity)
	 - look for a definition of this identifier in the hierarchy of scopes
	 - if not found, creates a NonLocalDeclaration for it
	 - binds this reference to the declaration"

	(self findDeclaration: aFASTIdentifier name)
	ifNil: [
		self
			nonLocalDeclaration: aFASTIdentifier
			withName: aFASTIdentifier name
	]
	ifNotNil: [ :decl |
		self 
			localDeclaration: decl
			for: aFASTIdentifier
		 ]
]

{ #category : #visiting }
FASTLocalResolverVisitor >> visitFASTLocalDeclaration: aFASTVariableDeclaration [
	"register a variable (structuralEntity) declaration into the current scope"

	self
		scopeAdd: aFASTVariableDeclaration variable name
		declaration: aFASTVariableDeclaration.

	aFASTVariableDeclaration variable localDeclaration: aFASTVariableDeclaration.

]

{ #category : #visiting }
FASTLocalResolverVisitor >> visitFASTScopeChildren: childrenNodes [
	"creates a new scope and visit its children nodes
	 Order of nodes is important to ensure declarations are visited before statements"

	self pushScope.

	(childrenNodes sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	^self popScope
]

{ #category : #generated }
FASTLocalResolverVisitor >> visitFASTTStatementBlock: aFASTJavaStatementBlock [
	self pushScope.

	"visit order is important to ensure declarations are visited before statements"
	(aFASTJavaStatementBlock statements sorted: [:a :b | a startPos < b startPos])
		do: [ :node | node accept: self ].

	^self popScope
]

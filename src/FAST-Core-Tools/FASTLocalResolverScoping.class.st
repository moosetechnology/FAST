"
I handle scopes and there local declarations for `FASTLocalResolver`s

I can:
- search for variable declarations in a scope and its parents.
- link variable uses to their declaration
"
Class {
	#name : #FASTLocalResolverScoping,
	#superclass : #FASTCoreVisitor,
	#instVars : [
		'scopes'
	],
	#category : #'FAST-Core-Tools-Resolver'
}

{ #category : #api }
FASTLocalResolverScoping >> bind: aFASTNode toLocalDeclaration: aName [
	"reference to aName by aFASTNode
	 - assuming the identifier refers to a variable (structuralEntity)
	 - look for a definition of this identifier in the hierarchy of scopes
	 - if not found, creates a `#nonLocalDeclaration:` for it
	 - binds this reference to the declaration"

	self
		localDeclaration: (
			(self findDeclaration: aName)
				ifNil: [ self scopeAddNonLocalDeclaration: aName ])
		for: aFASTNode
]

{ #category : #accessing }
FASTLocalResolverScoping >> currentScope [

	^ scopes top
]

{ #category : #api }
FASTLocalResolverScoping >> findDeclaration: aName [
	"search for 'aName' in the current scope and its parent.
	Returns nil if not found"

	^self currentScope
		at: aName
		ifAbsent: [ |scope decl|
			decl := nil.
			scope := self popScope.
			self hasScopes
				ifTrue: [ decl := self findDeclaration: aName ].
			self pushScope: scope.
			decl
		]
]

{ #category : #accessing }
FASTLocalResolverScoping >> hasScopes [
	^scopes isNotEmpty
]

{ #category : #initialization }
FASTLocalResolverScoping >> initialize [ 
	super initialize.

	self resetScopes
]

{ #category : #api }
FASTLocalResolverScoping >> localDeclaration: declarationNode for: referingNode [
	referingNode localDeclaration: declarationNode.
	declarationNode addLocalUse: referingNode
]

{ #category : #private }
FASTLocalResolverScoping >> nonLocalDeclaration: name [

	^ FASTNonLocalDeclaration new name: name
]

{ #category : #accessing }
FASTLocalResolverScoping >> popScope [

	^scopes pop
]

{ #category : #accessing }
FASTLocalResolverScoping >> pushScope [

	self pushScope: Dictionary new
]

{ #category : #accessing }
FASTLocalResolverScoping >> pushScope: aScope [

	scopes push: aScope
]

{ #category : #accessing }
FASTLocalResolverScoping >> resetScopes [

	scopes := Stack new.
	"first scope for the method"
	self pushScope
]

{ #category : #api }
FASTLocalResolverScoping >> scopeAdd: aName declaration: aFASTNode [

	self currentScope
		at: aName
		ifPresent: [ DuplicatedVariableError signal:
			'local variable ' , aName , 'already found in this scope' ]
		ifAbsent: [
			aFASTNode resetLocalUses.
			self currentScope at: aName put: aFASTNode
		].
	
]

{ #category : #api }
FASTLocalResolverScoping >> scopeAddNonLocalDeclaration: name [
	"makes a non-local declaration kind of local by adding
	 a FASTNonLocalDeclaration into the current scope"

	| currentScope nonLocalDeclaration |
	currentScope := self popScope.
	scopes
		ifEmpty: [
			self pushScope: currentScope.
			nonLocalDeclaration := self nonLocalDeclaration: name.
			self scopeAdd: name declaration: nonLocalDeclaration ]
		ifNotEmpty: [
			nonLocalDeclaration := self scopeAddNonLocalDeclaration: name.
			self pushScope: currentScope ].
	^ nonLocalDeclaration
]

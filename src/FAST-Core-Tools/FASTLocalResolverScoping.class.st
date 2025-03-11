"
I handle scopes and their local declarations for `FASTLocalResolver`

I can:
- search for variable declarations in a scope and its parents.
- bind variable uses to their declaration
"
Class {
	#name : 'FASTLocalResolverScoping',
	#superclass : 'Object',
	#instVars : [
		'scopes'
	],
	#category : 'FAST-Core-Tools-Resolver',
	#package : 'FAST-Core-Tools',
	#tag : 'Resolver'
}

{ #category : 'api' }
FASTLocalResolverScoping >> addUse: referingNode toLocalDeclaration: declarationNode [
	referingNode localDeclaration: declarationNode.
	declarationNode addLocalUse: referingNode
]

{ #category : 'api' }
FASTLocalResolverScoping >> bind: aFASTNode toLocalDeclaration: aName [
	"reference to aName by aFASTNode
	 - assuming the identifier refers to a variable (structuralEntity)
	 - look for a definition of this identifier in the hierarchy of scopes
	 - if not found, creates a `#nonLocalDeclaration:` for it
	 - binds the reference made by aFASTNode to the declaration of aName"

	self
		addUse: aFASTNode
		toLocalDeclaration: ((self findDeclaration: aName) ifNil: [
				 self scopeAddNonLocalDeclaration: aName ])
]

{ #category : 'accessing' }
FASTLocalResolverScoping >> currentScope [

	^ scopes top
]

{ #category : 'api' }
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

{ #category : 'accessing' }
FASTLocalResolverScoping >> hasScopes [
	^scopes isNotEmpty
]

{ #category : 'initialization' }
FASTLocalResolverScoping >> initialize [ 
	super initialize.

	self resetScopes
]

{ #category : 'private' }
FASTLocalResolverScoping >> nonLocalDeclaration: name [

	^ FASTNonLocalDeclaration new name: name
]

{ #category : 'accessing' }
FASTLocalResolverScoping >> popScope [

	^scopes pop
]

{ #category : 'accessing' }
FASTLocalResolverScoping >> pushScope [

	self pushScope: Dictionary new
]

{ #category : 'accessing' }
FASTLocalResolverScoping >> pushScope: aScope [

	scopes push: aScope
]

{ #category : 'accessing' }
FASTLocalResolverScoping >> resetScopes [

	scopes := Stack new.
	"first scope for the method"
	self pushScope
]

{ #category : 'api' }
FASTLocalResolverScoping >> scopeAdd: aName declaration: aFASTNode [

	self currentScope
		at: aName
		ifPresent: [ DuplicatedVariableError signal:
			'local variable ' , aName , ' already found in this scope' ]
		ifAbsent: [
			aFASTNode clearLocalUses.
			self currentScope at: aName put: aFASTNode
		].
	
]

{ #category : 'api' }
FASTLocalResolverScoping >> scopeAddNonLocalDeclaration: name [
	"makes a non-local declaration kind of local by adding
	 a FASTNonLocalDeclaration into the top-most scope"

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

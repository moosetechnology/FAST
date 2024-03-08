"
A FASTLocalResolverScopingTest is a test class for testing the behavior of FASTLocalResolverScoping
"
Class {
	#name : #FASTLocalResolverScopingTest,
	#superclass : #TestCase,
	#instVars : [
		'resolverScoping'
	],
	#category : #'FAST-Core-Tools-Tests-Resolver'
}

{ #category : #running }
FASTLocalResolverScopingTest >> setUp [
	super setUp.

	resolverScoping := FASTLocalResolverScoping new
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testAddNonLocalDeclaration [
	"testing helper method #addNonLocalDeclaration:"
	resolverScoping resetScopes.
	resolverScoping pushScope.

	resolverScoping scopeAddNonLocalDeclaration: 'blah'.

	"second scope is empty"
	self assert: resolverScoping popScope isEmpty.

	"first scope contains NonLocalDeclaration"
	self assert: (resolverScoping findDeclaration: 'blah') class equals: FASTNonLocalDeclaration
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testFindDeclarationInCurrentScope [
	|node|
	node := FASTEntity new.
	resolverScoping resetScopes.
	resolverScoping scopeAdd: 'blah' declaration: node.

	self assert: (resolverScoping findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testFindDeclarationInEmptyScope [
	resolverScoping resetScopes.
	self assert: (resolverScoping findDeclaration: 'blah') equals: nil.

]

{ #category : #tests }
FASTLocalResolverScopingTest >> testFindDeclarationInParentScope [
	|node|
	node := FASTEntity new.
	resolverScoping resetScopes.
	resolverScoping scopeAdd: 'blah' declaration: node.
	resolverScoping pushScope.

	self assert: (resolverScoping findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testFindDeclarationNotInScope [
	|node|
	node := FASTEntity new.
	resolverScoping resetScopes.
	resolverScoping scopeAdd: 'blah' declaration: node.

	self assert: (resolverScoping findDeclaration: 'blih') equals: nil.

]

{ #category : #tests }
FASTLocalResolverScopingTest >> testHasScopes [
	"initialization creates a scope"

	self assert: resolverScoping hasScopes 
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testLocalDeclarationFor [
	"testing helper method #localDeclaration:for:"
	| declNode refNode |
	declNode := FASTEntity new.
	refNode := FASTEntity new.
	declNode resetLocalUses.
	resolverScoping localDeclaration: declNode for: refNode.

	self assert: refNode localDeclaration notNil.
	self assert: refNode localDeclaration equals: declNode.

	self assert: declNode localUses size equals: 1.
	self assert: declNode localUses first equals: refNode
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testResetScopes [
	resolverScoping resetScopes.
	self assert: resolverScoping hasScopes.

]

{ #category : #tests }
FASTLocalResolverScopingTest >> testScopeAddDeclarationTwiceRaisesError [
	|node|
	node := FASTEntity new.
	resolverScoping resetScopes.

	resolverScoping scopeAdd: 'blah' declaration: node.

	self assert: resolverScoping currentScope size equals: 1.

	self
		should: [ resolverScoping scopeAdd: 'blah' declaration: node ]
		raise: DuplicatedVariableError
]

{ #category : #tests }
FASTLocalResolverScopingTest >> testScopeAddNonLocalDeclarationTwiceRaisesError [
	|node|
	node := FASTEntity new.
	resolverScoping resetScopes.

	resolverScoping scopeAddNonLocalDeclaration: 'blah'.

	self assert: resolverScoping currentScope size equals: 1.

	self
		should: [ resolverScoping scopeAddNonLocalDeclaration: 'blah' ]
		raise: DuplicatedVariableError
]

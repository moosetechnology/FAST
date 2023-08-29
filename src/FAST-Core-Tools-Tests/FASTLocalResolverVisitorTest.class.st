"
A FASTJavaLocalResolverVisitorTest is a test class for testing the behavior of FASTJavaLocalResolverVisitor
"
Class {
	#name : #FASTLocalResolverVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'localResolver',
		'builder'
	],
	#category : #'FAST-Core-Tools-Tests-resolver'
}

{ #category : #running }
FASTLocalResolverVisitorTest >> setUp [
	super setUp.

	localResolver := FASTJavaLocalResolverVisitor new
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testAddNonLocalDeclaration [
	"testing helper method #addNonLocalDeclaration:"
	localResolver resetScopes.
	localResolver pushScope.

	localResolver scopeAddNonLocalDeclaration: 'blah'.

	"second scope is empty"
	self assert: localResolver popScope isEmpty.

	"first scope contains NonLocalDeclaration"
	self assert: (localResolver findDeclaration: 'blah') class equals: FASTNonLocalDeclaration
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testFindDeclarationInCurrentScope [
	|node|
	node := FASTEntity new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.

	self assert: (localResolver findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testFindDeclarationInEmptyScope [
	localResolver resetScopes.
	self assert: (localResolver findDeclaration: 'blah') equals: nil.

]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testFindDeclarationInParentScope [
	|node|
	node := FASTEntity new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.
	localResolver pushScope.

	self assert: (localResolver findDeclaration: 'blah') equals: node
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testFindDeclarationNotInScope [
	|node|
	node := FASTEntity new.
	localResolver resetScopes.
	localResolver scopeAdd: 'blah' declaration: node.

	self assert: (localResolver findDeclaration: 'blih') equals: nil.

]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testHasScopes [
	self deny: localResolver hasScopes 
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testLocalDeclarationFor [
	"testing helper method #localDeclaration:for:"
	| declNode refNode |
	declNode := FASTEntity new.
	refNode := FASTEntity new.
	declNode resetLocalUses.
	localResolver localDeclaration: declNode for: refNode.

	self assert: refNode localDeclaration notNil.
	self assert: refNode localDeclaration equals: declNode.

	self assert: declNode localUses size equals: 1.
	self assert: declNode localUses first equals: refNode
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testNonLocalDeclarationWithName [
	"testing helper method #nonLocalDeclaration:withName:"
	| node |
	node := FASTEntity new.
	localResolver resetScopes.

	localResolver nonLocalDeclaration: node withName: 'blah'.

	self assert: node localDeclaration notNil.
	self assert: node localDeclaration class equals: FASTNonLocalDeclaration.
	self assert: node localDeclaration name equals: 'blah'
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testResetScopes [
	localResolver resetScopes.
	self assert: localResolver hasScopes.

]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testScopeAddDeclarationTwiceRaisesError [
	|node|
	node := FASTEntity new.
	localResolver resetScopes.

	localResolver scopeAdd: 'blah' declaration: node.

	self assert: localResolver currentScope size equals: 1.

	self
		should: [ localResolver scopeAdd: 'blah' declaration: node ]
		raise: DuplicatedVariableError
]

{ #category : #tests }
FASTLocalResolverVisitorTest >> testScopeAddNonLocalDeclarationTwiceRaisesError [
	|node|
	node := FASTEntity new.
	localResolver resetScopes.

	localResolver scopeAddNonLocalDeclaration: 'blah'.

	self assert: localResolver currentScope size equals: 1.

	self
		should: [ localResolver scopeAddNonLocalDeclaration: 'blah' ]
		raise: DuplicatedVariableError
]

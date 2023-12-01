Class {
	#name : #FamixModelComparatorTest,
	#superclass : #TestCase,
	#instVars : [
		'validator'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #running }
FamixModelComparatorTest >> setUp [

	validator := FamixModelComparatorForTesting new
]

{ #category : #tests }
FamixModelComparatorTest >> testClassDifference [

	| node1 node2 |
	node1 := FASTEntity new.
	node2 := MooseEntity new.

	self
		should: [ validator compare: node1 to: node2 ]
		raise: FamixModelComparatorRecoveryException 
]

{ #category : #tests }
FamixModelComparatorTest >> testClassNoDifference [

	| node1 node2 |
	node1 := FASTEntity new.
	node2 := FASTEntity new.

	self
		shouldnt: [ validator compare: node1 to: node2 ]
		raise: FamixModelComparatorRecoveryException 
]

{ #category : #tests }
FamixModelComparatorTest >> testPropertyAcceptableDifference [

	| node1 node2 |
	node1 := FamixStNamedEntity  new name: 'acceptable'.
	node2 := FamixStNamedEntity  new name: 'other'.

	self
		shouldnt: [ validator compare: node1 to: node2 ]
		raise: FamixModelComparatorRecoveryException 
]

{ #category : #tests }
FamixModelComparatorTest >> testPropertyDifference [

	| node1 node2 |
	node1 := FamixStNamedEntity  new name: 'a'.
	node2 := FamixStNamedEntity  new name: 'b'.

	self
		should: [ validator compare: node1 to: node2 ]
		raise: FamixModelComparatorRecoveryException 
]

{ #category : #tests }
FamixModelComparatorTest >> testPropertyNoDifference [

	| node1 node2 |
	node1 := FamixStNamedEntity  new name: 'a'.
	node2 := FamixStNamedEntity  new name: 'a'.

	self
		shouldnt: [ validator compare: node1 to: node2 ]
		raise: FamixModelComparatorRecoveryException 
]

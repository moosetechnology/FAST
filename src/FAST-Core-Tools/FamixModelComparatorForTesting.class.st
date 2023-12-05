Class {
	#name : #FamixModelComparatorForTesting,
	#superclass : #FamixModelComparator,
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #comparison }
FamixModelComparatorForTesting >> ast: node1 acceptableDifferenceTo: node2 property: property [

	| recoveryBlock |
	recoveryBlock := [:a :b | a class = FamixStNamedEntity].
	
	((node1 class = FamixStNamedEntity) and:
	[ (property implementingSelector = #name) and:
	[ (node1 perform: property implementingSelector) = #acceptable ] ])
	ifTrue: [ ^recoveryBlock ].

	^nil
]

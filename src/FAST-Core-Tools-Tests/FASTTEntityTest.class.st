"
Tests for #startLine and #endLine on FASTTEntity. These methods compute 1-based line numbers from the character offsets (startPos/endPos) by counting LF in the entity's sourceText.
"
Class {
	#name : 'FASTTEntityTest',
	#superclass : 'TestCase',
	#category : 'FAST-Core-Tools-Tests',
	#package : 'FAST-Core-Tools-Tests'
}

{ #category : 'helpers' }
FASTTEntityTest >> containerEntityWithChildren [

	| container |
	container := self entityWithStartPosition: 1 endPosition: 17.
	container addStatement: (self newMethodWithStartPosition: 1 endPosition: 5).
	container addStatement: (self newMethodWithStartPosition: 7 endPosition: 11).
	container addStatement: (self newMethodWithStartPosition: 13 endPosition: 17).
	^ container
]

{ #category : 'helpers' }
FASTTEntityTest >> entityWithStartPosition: start endPosition: end [

	^ FASTTestClass new
		  startPos: start;
		  endPos: end;
		  source: self sourceCode;
		  yourself
]

{ #category : 'helpers' }
FASTTEntityTest >> nestedContainerEntity [

	| container child |
	container := self entityWithStartPosition: 1 endPosition: 17.
	child := self entityWithStartPosition: 7 endPosition: 17.
	container addStatement: child.
	child addStatement: (self newMethodWithStartPosition: 7 endPosition: 11).
	child addStatement: (self newMethodWithStartPosition: 13 endPosition: 17).
	^ container
]

{ #category : 'helpers' }
FASTTEntityTest >> newMethodWithStartPosition: start endPosition: end [

	^ FASTTestMethod new
		  startPos: start;
		  endPos: end;
		  yourself
]

{ #category : 'helpers' }
FASTTEntityTest >> sourceCode [

	^ 'x = 1
y = 2
z = 3'
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testBoundaryLinesAreInclusive [

	| container result |
	container := self containerEntityWithChildren.
	result := container nodesIncludedBetween: 1 and: 1.

	self assert: result size equals: 1.
	self assert: result first startLine equals: 1
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testEndLineOnFirstLine [
	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 5.

	self assert: entity endLine equals: 1
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testEndLineOnThirdLine [
	| entity |
	entity := self entityWithStartPosition: 13 endPosition: 17.

	self assert: entity endLine equals: 3
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testIncludedNodesWithinLineRange [

	| container result |
	container := self containerEntityWithChildren.
	result := container nodesIncludedBetween: 2 and: 2.

	self assert: result size equals: 1.
	self assert: result first startLine equals: 2
]

{ #category : 'tests - isBetweenLineAnd' }
FASTTEntityTest >> testIsBetweenLineAndNodeAtExactBounds [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self assert: (entity isBetweenLine: 1 and: 2)
]

{ #category : 'tests - isBetweenLineAnd' }
FASTTEntityTest >> testIsBetweenLineAndNodeExtendsBeforeStart [

	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 17.

	self deny: (entity isBetweenLine: 3 and: 3)
]

{ #category : 'tests - isBetweenLineAnd' }
FASTTEntityTest >> testIsBetweenLineAndNodeExtendsBeyondEnd [

	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 17.

	self deny: (entity isBetweenLine: 2 and: 2)
]

{ #category : 'tests - isBetweenLineAnd' }
FASTTEntityTest >> testIsBetweenLineAndNodeFullyWithin [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self assert: (entity isBetweenLine: 1 and: 3)
]

{ #category : 'tests - isBetweenLineAnd' }
FASTTEntityTest >> testIsBetweenLineAndNodeOutside [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 5.

	self deny: (entity isBetweenLine: 2 and: 3)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeAtExactBounds [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self deny: (entity isPartiallyBetweenLine: 1 and: 2)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeEncompassesRange [

	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 17.

	self assert: (entity isPartiallyBetweenLine: 2 and: 2)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeExtendsBeforeStart [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self assert: (entity isPartiallyBetweenLine: 2 and: 3)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeExtendsBeyondEnd [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self assert: (entity isPartiallyBetweenLine: 1 and: 1)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeFullyWithin [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self deny: (entity isPartiallyBetweenLine: 1 and: 3)
]

{ #category : 'tests - isPartiallyInBetweenLineAnd' }
FASTTEntityTest >> testIsPartiallyBetweenLineAndNodeOutside [

	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 11.

	self deny: (entity isPartiallyBetweenLine: 3 and: 3)
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testLineRangeCoveringWholeSourceIncludesAllStatements [

	| container result |
	container := self containerEntityWithChildren.
	result := container nodesIncludedBetween: 1 and: 3.

	self assert: result size equals: 3
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testNestedNodesIncludedOnlyWhenFullyInRange [

	| container result |
	container := self nestedContainerEntity.
	result := container nodesIncludedBetween: 2 and: 2.

	self assert: result size equals: 1.
	self assert: result first startLine equals: 2
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testNoNodesWhenLineRangeIsOutsideSource [

	| container result |
	container := self containerEntityWithChildren.
	result := container nodesIncludedBetween: 4 and: 4.

	self assertEmpty: result
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testNodeStartingInsideButEndingOutsideIsExcluded [

	| container result |
	container := self entityWithStartPosition: 1 endPosition: 17.
	container addStatement: (self newMethodWithStartPosition: 7 endPosition: 17).

	result := container nodesIncludedBetween: 2 and: 2.

	self assertEmpty: result
]

{ #category : 'tests - nodesBetweenLineAnd' }
FASTTEntityTest >> testPartiallyOverlappingNodesAreExcluded [

	| container child |
	container := self entityWithStartPosition: 1 endPosition: 17.
	child := self newMethodWithStartPosition: 7 endPosition: 17.
	container addStatement: child.

	self deny: ((container nodesIncludedBetween: 1 and: 1) includes: child)
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testStartAndEndLineOnSameLine [
	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 10.

	self assert: entity startLine equals: entity endLine
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testStartLineOnFirstLine [
	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 5.

	self assert: entity startLine equals: 1
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testStartLineOnSecondLine [
	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 10.

	self assert: entity startLine equals: 2
]

{ #category : 'tests - start/endLine' }
FASTTEntityTest >> testStartLineOnThirdLine [
	| entity |
	entity := self entityWithStartPosition: 13 endPosition: 17.

	self assert: entity startLine equals: 3
]

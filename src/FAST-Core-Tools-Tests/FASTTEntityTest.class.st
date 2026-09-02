"
Tests for #startLine and #endLine on FASTTEntity. These methods compute 1-based line numbers from the character offsets (startPos/endPos) by counting LF in the entity's sourceText.
"
Class {
	#name : 'FASTTEntityTest',
	#superclass : 'TestCase',
	#category : 'FAST-Core-Tools-Tests',
	#package : 'FAST-Core-Tools-Tests'
}

{ #category : 'tests' }
FASTTEntityTest >> entityWithStartPosition: start endPosition: end [
	| entity |
	entity := FASTEntity new.
	entity startPos: start.
	entity endPos: end.
	entity addTalent: FamixTHasImmediateSource.
	entity source: 'x = 1
y = 2
z = 3'.
	^ entity
]

{ #category : 'tests' }
FASTTEntityTest >> testEndLineOnFirstLine [
	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 5.

	self assert: entity endLine equals: 1
]

{ #category : 'tests' }
FASTTEntityTest >> testEndLineOnThirdLine [
	| entity |
	entity := self entityWithStartPosition: 13 endPosition: 17.

	self assert: entity endLine equals: 3
]

{ #category : 'tests' }
FASTTEntityTest >> testStartAndEndLineOnSameLine [
	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 10.

	self assert: entity startLine equals: entity endLine
]

{ #category : 'tests' }
FASTTEntityTest >> testStartLineOnFirstLine [
	| entity |
	entity := self entityWithStartPosition: 1 endPosition: 5.

	self assert: entity startLine equals: 1
]

{ #category : 'tests' }
FASTTEntityTest >> testStartLineOnSecondLine [
	| entity |
	entity := self entityWithStartPosition: 7 endPosition: 10.

	self assert: entity startLine equals: 2
]

{ #category : 'tests' }
FASTTEntityTest >> testStartLineOnThirdLine [
	| entity |
	entity := self entityWithStartPosition: 13 endPosition: 17.

	self assert: entity startLine equals: 3
]

Extension { #name : #FASTEntity }

{ #category : #'*FAST-GTExtensions' }
FASTEntity >> gtNodesIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite tree
		title: 'Tree';
		display: [ :anObject | anObject ];
		children: [ :each | each children ];
		yourself
]

{ #category : #'*FAST-GTExtensions' }
FASTEntity >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 1001>
	^ composite text
		title: 'Source code';
		display: [ self ];
		format: [ :t | self sourceText ifNil: [ 'No source code available' ] ifNotNil: [ self mooseModel fastHighligther new highlight: self rootNode ] ];
		withLineNumbers: true;
		initialize: [ :presentation |  presentation selectionInterval: (self startPos to: self endPos) ];
		when: [ (self sourceText isNotNil and: [ self startPos isNotNil and: [ self endPos isNotNil ] ]) ];
		yourself
]

{ #category : #'*FAST-GTExtensions' }
FASTEntity >> sourceCodeAsText [
	^ self rootNode sourceText asText
]

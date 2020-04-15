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
		initialize: [ :presentation | (self sourceText isNil or: [ self startPos isNil or: [ self endPos isNil ] ]) ifFalse: [ presentation selectionInterval: (self startPos to: self endPos) ] ];
		yourself
]

{ #category : #'*FAST-GTExtensions' }
FASTEntity >> sourceCodeAsText [
	^ self rootNode sourceText asText
]

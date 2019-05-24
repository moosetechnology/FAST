Extension { #name : #FASTEntitySourceAnchor }

{ #category : #'*FAST-GTExtensions' }
FASTEntitySourceAnchor >> gtNodesIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite tree
		title: 'Tree';
		display: [ :anObject | anObject ];
		children: [ :each | each childrenNode ];
		yourself
]

{ #category : #'*FAST-GTExtensions' }
FASTEntitySourceAnchor >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 1001>
	^ composite text
		title: 'Source code';
		display: [ self ];
		format: [ :t | self sourceText ifNil: [ 'No source code available' ] ifNotNil: [ self sourceCodeAsText ] ];
		withLineNumbers: true;
		initialize: [ :presentation | (self sourceText isNil or: [ self startPos isNil or: [ self endPos isNil ] ]) ifFalse: [ presentation selectionInterval: (self startPos to: self endPos) ] ];
		yourself
]

{ #category : #'*FAST-GTExtensions' }
FASTEntitySourceAnchor >> sourceCodeAsText [
	^ self sourceText asText
]

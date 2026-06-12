"
I am an abstract bloc in a CFG graph. I define the common API of all blocks.

All nodes store:
- A boolean to know if they are the start of a CFG graph via `#isStart`
- A list of statements that are in the block. At the exception of a `FASTCFGTryBlock` that can be stopped at any statement, all statements of a block will be executed if the execution enter this block
- The previous blocks pointing to me in the graph

All nodes should be able to provide their next blocks via `#nextBlocks`, but the number of blocks possible vary depending on the node. 

A node should return true to `#isFull` if it has all its required next blocks. 

A node should return true to `#isFinal` if it is the exit of the CFG graph. A CFG graph will always have one exit. In case of multiple exits, we create a `FASTCFGNullBlock` to join the exits.
"
Class {
	#name : 'FASTCFGAbstractBlock',
	#superclass : 'Object',
	#instVars : [
		'isStart',
		'statements',
		'previousBlocks'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTCFGAbstractBlock >> addNextBlock: aBlock [

	^ self subclassResponsibility
]

{ #category : 'adding' }
FASTCFGAbstractBlock >> addPreviousBlock: aBlock [

	(self previousBlocks includes: aBlock) ifFalse: [ self previousBlocks add: aBlock ]
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> allEffectiveBreakingBlocks [
	"Return all breaking nodes. If we encounter a loop, we will ignore the breaking nodes inside since they apply to this loop and not the englobing loop in case of a loop in a loop"

	| childrenBreakingBlocks |
	childrenBreakingBlocks := (self nextBlocks reject: #isLoop) flatCollect: #allEffectiveBreakingBlocks as: OrderedCollection.

	self endsWithBreakStatement ifTrue: [ childrenBreakingBlocks add: self ].

	^ childrenBreakingBlocks
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> allFollowingBlocks [

	^ self deep: #nextBlocks collect: #yourself
]

{ #category : 'mermaid' }
FASTCFGAbstractBlock >> asMermaidScript [
	"I genrerate a mermaid script to display the flowchart"

	self isStart ifFalse: [ self error: 'We should start by the start node' ].
	^ String streamContents: [ :aStream |
			  | nodesIDs treatedBlocks |
			  nodesIDs := Dictionary new.
			  aStream
				  nextPutAll: 'flowchart TD';
				  lf;
				  tab;
				  nextPutAll: 'subgraph Entry';
				  lf;
				  tab;
				  tab;
				  nextPutAll: 'direction TB';
				  lf;
				  tab;
				  tab;
				  nextPutAll: (nodesIDs at: self ifAbsentPut: [ self hash asString ]);
				  lf;
				  tab;
				  tab;
				  nextPutAll: 'end';
				  lf;
				  cr;
				  cr;
				  nextPutAll: 'subgraph Exit';
				  lf;
				  tab;
				  tab;
				  nextPutAll: 'direction TB';
				  lf;
				  tab;
				  tab;
				  nextPutAll: (nodesIDs at: (self allFollowingBlocks detect: #isFinal) ifAbsentPut: [ (self allFollowingBlocks detect: #isFinal) hash asString ]);
				  lf;
				  tab;
				  tab;
				  nextPutAll: 'end';
				  lf;
				  cr;
				  cr.
			  treatedBlocks := Set new.
			  self printMermaidOn: aStream ids: nodesIDs treatedBlocks: treatedBlocks ]
]

{ #category : 'private' }
FASTCFGAbstractBlock >> endsWithBreakStatement [

	^ self subclassResponsibility
]

{ #category : 'private' }
FASTCFGAbstractBlock >> endsWithContinueStatement [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> firstParentLoop [
	"I return the first loop containing myself.
	This is useful to know which loop a node ending with a break statement will break."

	self deep: #previousBlocks do: [ :parent | parent isLoop ifTrue: [ ^ parent ] ].

	^ nil
]

{ #category : 'initialization' }
FASTCFGAbstractBlock >> initialize [

	super initialize.
	previousBlocks := OrderedCollection new.
	isStart := false
]

{ #category : 'inspector' }
FASTCFGAbstractBlock >> inspectionVisualization: aBuilder [

	<inspectorPresentationOrder: 3 title: 'Visu'>
	^ (aBuilder instantiate: SpRoassalInspectorPresenter)
		  canvas: (FASTCFGVisualizationBuilder on: self);
		  yourself
]

{ #category : 'inspector' }
FASTCFGAbstractBlock >> inspectionVisualizationContext: aContext [

	aContext active: self isStart
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isConditional [

	^ false
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isFinal [

	^ self nextBlocks isEmpty
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isFull [
	"A node is full when it had all its next block set."

	^ self subclassResponsibility
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isLoop [

	^ false
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isNullBlock [

	^ false
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> isStart [
	^ isStart
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> isStart: anObject [
	isStart := anObject
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isSwitch [

	^ false
]

{ #category : 'testing' }
FASTCFGAbstractBlock >> isTry [

	^ false
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> nextBlockForValues [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> nextBlocks [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> previousBlocks [
	^ previousBlocks
]

{ #category : 'mermaid' }
FASTCFGAbstractBlock >> printMermaidOn: aStream ids: nodesIDs treatedBlocks: treatedBlocks [

	| id |
	(treatedBlocks includes: self) ifTrue: [ ^ self ].
	id := nodesIDs at: self ifAbsentPut: [ self hash asString ].
	treatedBlocks add: self.

	aStream
		nextPutAll: id;
		nextPutAll: (self isStart
				 ifTrue: [ '{' ]
				 ifFalse: [
						 self isFinal
							 ifTrue: [ '(((' ]
							 ifFalse: [ '(' ] ]);
		nextPut: $";
		nextPutAll: ('<br/>' join: self sourceCode lines);
		nextPutAll: ' "';
		nextPutAll: (self isStart
				 ifTrue: [ '}' ]
				 ifFalse: [
						 self isFinal
							 ifTrue: [ ')))' ]
							 ifFalse: [ ')' ] ]);
		lf;
		tab.

	self nextBlockForValues do: [ :asso |
			aStream
				nextPutAll: id;
				nextPutAll: ' --'.
			asso key asString ifNotEmpty: [
					aStream
						space;
						nextPutAll: asso key asString capitalized;
						space ].
			aStream
				nextPutAll: '--> ';
				nextPutAll: (nodesIDs at: asso value ifAbsentPut: [ asso value hash asString ]);
				lf;
				tab ].

	self nextBlocks do: [ :block | block printMermaidOn: aStream ids: nodesIDs treatedBlocks: treatedBlocks ]
]

{ #category : 'private' }
FASTCFGAbstractBlock >> shouldBreakOrContinueInContext: context [
	"I should break or continue this node if i'm a break or continue and that we are currently visiting the first loop containing me to not mix loops in loops."

	| firstLoop |
	firstLoop := self firstParentLoop ifNil: [ ^ false ].

	(self endsWithBreakStatement or: [ self endsWithContinueStatement ]) ifFalse: [ ^ false ].

	^ context
		  detect: #isLoop
		  ifFound: [ :loop | loop conditional = firstLoop ]
		  ifNone: [ false ]
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> sourceCode [

	self statements isEmptyOrNil ifTrue: [ ^ '' ].

	^ self statements first sourceText copyFrom: self statements first startPos to: self statements last endPos
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> statements [
	^ statements
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> statements: anObject [
	statements := anObject
]

{ #category : 'accessing' }
FASTCFGAbstractBlock >> withAllFollowingBlocks [

	^ self withDeep: #nextBlocks collect: #yourself
]

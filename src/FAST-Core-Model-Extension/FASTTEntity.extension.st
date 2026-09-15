Extension { #name : 'FASTTEntity' }

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> addNodesIncludedBetween: startLine and: endLine into: result [
	"If an entity is in the lines, we add it to the result. If it is partialy in the lines, we check if they have a child inside."

	self containedEntities do: [ :entity |
			(entity isBetweenLine: startLine and: endLine) ifTrue: [ result add: entity ].
			(entity isPartiallyBetweenLine: startLine and: endLine) ifTrue: [ entity addNodesIncludedBetween: startLine and: endLine into: result ] ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> asSourceCode [
	"Export AST as code using an exporter if available."

	^ self class environment
		  at: self exporterClassName
		  ifPresent: [ :exporter | exporter new export: self ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> currentParentSelector [
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | ^ accessor ] ].
	^ nil
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> display [
	"default display line is the source code of the entity"

	| sourceText |
	sourceText := (self startPos isNotNil and: [ self endPos isNotNil ])
		              ifTrue: [ self rootNode sourceText ].
	^ sourceText isEmptyOrNil
		  ifTrue: [ self class name allButFirst: 4 ]
		  ifFalse: [
			  (self class name allButFirst: 4) , ': '
			  , (sourceText copyFrom: self startPos to: self endPos)
				  truncateWithElipsisTo: 50 ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> endLine [

	<FMProperty: #endLine type: #Number>
	<FMComment: 'Number of the end line of this entity in the complete source'>
	^ self cacheAt: #endLine ifAbsentPut: [ self sourceText lineNumberCorrespondingToIndex: self endPos ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> exporterClassName [
	"Should be redefined in concrete superclass (e.g. FASTJavaEntity) to answer the name of an exporter."

	^ [ super exporterClassName ]
		  on: MessageNotUnderstood
		  do: [ nil ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> inspectionFAST: aBuilder [

	<inspectorPresentationOrder: 1.1 title: 'FAST'>
	^ aBuilder newTreeTable
		  addColumn: (SpCompositeTableColumn new
				   addColumn: ((SpImageTableColumn evaluated: #mooseIcon)
						    width: 20;
						    yourself);
				   addColumn: (SpStringTableColumn evaluated: [ :node | node display ]);
				   yourself);
		  children: [ :aClass | aClass containedEntities asArray sorted: [ :a :b | (a startPos ifNil: [ 0 ]) <= (b startPos ifNil: [ 0 ]) ] ];
		  beMultipleSelection;
		  expandAll;
		  roots: { self };
		  beResizable;
		  yourself
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> inspectionFASTSourceCode: aBuilder [

	<inspectorPresentationOrder: 1.2 title: 'FASTSourceCode'>
	| hasSource sourceText |
	(hasSource := self sourceText isNotEmpty and: [ self startPos isNotNil and: [ self endPos isNotNil ] ])
		ifFalse: [ "try to export source code"
				self asSourceCode
					ifNil: [
							^ aBuilder newText
								  text: 'Not available';
								  yourself ]
					ifNotNil: [ :code | sourceText := Text fromString: code ] ]
		ifTrue: [ sourceText := self mooseModel fastHighligther new highlight: self rootNode ].

	^ aBuilder newCode
		  withoutSyntaxHighlight;
		  withLineNumbers;
		  text: sourceText;
		  beNotEditable;
		  in: [ :this |
				  hasSource ifTrue: [
							  this
								  addTextSegmentDecoration: (SpTextPresenterDecorator forHighlight
										   interval: (self startPos to: self endPos);
										   yourself);
								  selectionInterval: (self startPos to: self endPos).
							  "I don't know why I need the double defer:... But it does not work without it. Also, this is bad because this is Morphic dependant. But I don't see how to do that with Spec for now."
							  this withAdapterPerformOrDefer: [ :anAdapter | this defer: [ this defer: [ anAdapter widget scrollPane scrollSelectionIntoView ] ] ] ] ];
		  yourself
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> isBetweenLine: startLine and: endLine [
	"I return true if I am fully included in the lines as parameter."

	^ self startLine >= startLine and: [ self endLine <= endLine ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> isPartiallyBetweenLine: startLine and: endLine [
	"I return true if I am partially included in the lines as parameter. If I am fully inside the bound, I return false."

	(self isBetweenLine: startLine and: endLine) ifTrue: [ ^ false ].

	self endLine < startLine ifTrue: [ ^ false ].

	self startLine > endLine ifTrue: [ ^ false ].

	^ true
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> nodesIncludedBetween: startLine and: endLine [
	"I return the nodes that are inside the given bounds, bounds included. 
	Nodes that are not entirely in the bounds are not considered.
	We take the most high level node matching this. It means that if an assignment node for `x = 1` matches, we add only this one and not the identifier `x` and literal `1` since they are subnodes of the assignment."

	| result |
	result := OrderedCollection new.
	self addNodesIncludedBetween: startLine and: endLine into: result.
	^ result
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> orderedChildren [
	^ self children asOrderedCollection sort: #startPos ascending
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> parentNode [

	self containersDo: [ :container | ^ container ].

	^ nil
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> removeAllPotentialChildrenNode [
	^ self childrenSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> removeAllPotentialParentNode [
	^ self parentSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> rootNode [

	"I should be overriden in my users"
	^ self parentNode ifNil: [ self ] ifNotNil: [:parent | parent rootNode ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> sourceCode [
	"I should be overriden in my users"

	^ self sourceText copyFrom: self startPos to: self endPos
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> sourceText [
	"I should be overriden in my users"

	^ (self containersOfType: FamixTHasImmediateSource)
		  ifNotEmpty: [ :sources | sources anyOne sourceText ]
		  ifEmpty: [ '' ]
]

{ #category : '*FAST-Core-Model-Extension' }
FASTTEntity >> startLine [

	<FMProperty: #startLine type: #Number>
	<FMComment: 'Number of the start line of this entity in the complete source'>
	^ self cacheAt: #startLine ifAbsentPut: [ self sourceText lineNumberCorrespondingToIndex: self startPos ]
]

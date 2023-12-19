Extension { #name : #FASTTEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> containers [
	^ ((self class allDeclaredPropertiesIn: self metamodel) select: #isContainer thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> currentParentSelector [
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | ^ accessor ] ].
	^ nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> display [

	"default display line is the source code of the entity"

	| sourceText |
	sourceText := (self startPos isNotNil and: [ self endPos isNotNil ]) 
		              ifTrue: [ self rootNode sourceText ].

	^ (self class name allButFirst: 4)
	  , (sourceText ifNil: [ '' ] ifNotNil: [ 
			   ': ' , (sourceText copyFrom: self startPos to: self endPos) 
				   truncateWithElipsisTo: 50 ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> inspectionFAST [

	<inspectorPresentationOrder: 1.1 title: 'FAST'>
	^ SpTreeTablePresenter new
		  addColumn: (SpCompositeTableColumn new
				   addColumn: ((SpImageTableColumn evaluated: #mooseIcon)
						    width: 20;
						    yourself);
				   addColumn:
				   (SpStringTableColumn evaluated: [ :node | node display ]);
				   yourself);
		  children: [ :aClass |
			  aClass children asArray sorted: [ :a :b |
				  (a startPos ifNil: [ 0 ]) <= (b startPos ifNil: [ 0 ]) ] ];
		  beMultipleSelection;
		  roots: { self };
		  beResizable
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> inspectionFASTSourceCode [

	<inspectorPresentationOrder: 1.2 title: 'FASTSourceCode'>
	(self sourceText isNotNil and: [
		 self startPos isNotNil and: [ self endPos isNotNil ] ]) ifFalse: [
		^ SpTextPresenter new
			  text: 'Not available';
			  yourself ].
	^ SpMorphPresenter new
		  morph: (RubScrolledTextMorph new
				   setText:
					   (self mooseModel fastHighligther new highlight: self rootNode);
				   in: [ :this | this textArea readOnly: true ];
				   selectionInterval: (self startPos to: self endPos);
				   yourself);
		  yourself
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> orderedChildren [
	^ self children asOrderedCollection sort: #startPos ascending
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> parentNode [
	^ self containers at: 1 ifAbsent: [ nil ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> removeAllPotentialChildrenNode [
	^ self childrenSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> removeAllPotentialParentNode [
	^ self parentSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> rootNode [

	"I should be overriden in my users"
	^ self parentNode ifNil: [ self ] ifNotNil: [:parent | parent rootNode ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> sourceCode [
	"I should be overriden in my users"

	^ self sourceText copyFrom: self startPos to: self endPos
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> sourceText [
	"I should be overriden in my users"

	^ (self atScope: FamixTHasImmediateSource)
		ifNotEmpty: [ :sources | sources anyOne source ifNil: [ '' ] ]
		ifEmpty: [ '' ]
]

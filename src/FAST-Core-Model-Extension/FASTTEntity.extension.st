Extension { #name : #FASTTEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> asSourceCode [
	"Export AST as code using an exporter if available."

	^ self class environment
		  at: self exporterClassName
		  ifPresent: [ :exporter | exporter new export: self ]
]

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
	^ sourceText isEmptyOrNil
		  ifTrue: [ self class name allButFirst: 4 ]
		  ifFalse: [
			  (self class name allButFirst: 4) , ': '
			  , (sourceText copyFrom: self startPos to: self endPos)
				  truncateWithElipsisTo: 50 ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTTEntity >> exporterClassName [
	"Should be redefined in concrete superclass (e.g. FASTJavaEntity) to answer the name of an exporter."

	^ [ super exporterClassName ]
		  on: MessageNotUnderstood
		  do: [ nil ]
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
	| hasSource sourceText |
	(hasSource := self sourceText isNotEmpty and: [
		              self startPos isNotNil and: [ self endPos isNotNil ] ])
		ifFalse: [ "try to export source code"
			self asSourceCode
				ifNil: [ ^ SpTextPresenter new text: 'Not available' ]
				ifNotNil: [ :code | sourceText := Text fromString: code ] ]
		ifTrue: [
			sourceText := self mooseModel fastHighligther new highlight:
				              self rootNode ].
	^ SpMorphPresenter new morph: (RubScrolledTextMorph new
			   setText: sourceText;
			   in: [ :this |
				   this textArea readOnly: true.
				   hasSource ifTrue: [
						   this selectionInterval: (self startPos to: self endPos) ] ];
			   yourself)
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

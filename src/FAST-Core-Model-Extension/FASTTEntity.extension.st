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

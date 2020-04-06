Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> childrenNode [
	"^ (((self class allDeclaredPropertiesIn: self metamodel) select: #isChildrenProperty thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil) flattened
"

	self deprecated: 'The method #childrenNode was not good. Use children instead.' transformWith: '`@receiver childrenNode' -> '`@receiver children'.
	^ self children
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> containers [
	^ ((self class allDeclaredPropertiesIn: self metamodel) select: #isContainer thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> currentParentSelector [
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | ^ accessor ] ].
	^ nil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> parentNode [
	^ self containers at: 1 ifAbsent: [ nil ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> removeAllPotentialChildrenNode [
	^ self childrenSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> removeAllPotentialParentNode [
	^ self parentSelectors do: [:selector | self perform: selector, ':' withArguments: { nil } ].
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> rootNode [

	"I should be overriden in my users"
	^ self parentNode ifNil: [ self ] ifNotNil: [:parent | parent rootNode ]
]

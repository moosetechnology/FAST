Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> childrenNode [

	<generated>
	^ (((self class allDeclaredPropertiesIn: self metamodel) select: #isChildrenProperty thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil) flattened

]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> containers [
	^ ((self class allDeclaredPropertiesIn: self metamodel) select: #isContainer thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntity >> parentNode [
	^ self containers at: 1 ifAbsent: [ nil ] 
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

Extension { #name : #FASTEntitySourceAnchor }

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntitySourceAnchor >> sourceCode [

	^ self sourceText copyFrom: self startPos to: self endPos
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTEntitySourceAnchor >> sourceText [

	"I should be overriden in my users"
	^ self parentNode ifNil: [ nil ] ifNotNil: [:parent | parent sourceText ]
]

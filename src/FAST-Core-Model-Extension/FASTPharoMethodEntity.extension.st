Extension { #name : #FASTPharoMethodEntity }

{ #category : #'*FAST-Core-Model-Extension' }
FASTPharoMethodEntity >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :existingParentNode | existingParentNode sourceText ] ]
]

Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaCharacterLiteral >> value [
	^ '''' , (String with: value) , ''''
]

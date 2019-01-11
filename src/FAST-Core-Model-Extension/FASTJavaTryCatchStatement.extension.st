Extension { #name : #FASTJavaTryCatchStatement }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaTryCatchStatement >> addCatch: aFASTJavaCatchPartStatement [ 
	self childrenNode add: aFASTJavaCatchPartStatement
	
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaTryCatchStatement >> catches [
	<computed>
	<navigation: #catches>
	^ (self childrenNode select: [ :childNode | childNode isKindOf: FASTJavaCatchPartStatement ])
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaTryCatchStatement >> try [
	<computed>
	<navigation: 'try'>
	^ (self childrenNode select: [ :childNode | childNode isKindOf: FASTJavaTryPartStatement  ])
		at: 1
		ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaTryCatchStatement >> try: aFASTJavaTryPartStatement [
	self childrenNode add: aFASTJavaTryPartStatement
]

Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> addArgument: anArgument [
	childrenNode add: anArgument
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> arguments [
	<computed>
	<navigation: 'arguments'>
	^ self childrenNode
		select: [ :childNode | 
			{FASTVariableExpression.
			FASTNamedEntity. FASTLiteral} anySatisfy: [ :possibleClass | childNode isKindOf: possibleClass ] ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> receiver [
	<computed>
	<navigation: 'receiver'>
	^ (self childrenNode select: [ :childNode | (childNode class isKindOf: FASTVariableExpression class) or: [ childNode class isKindOf: FASTJavaMethodInvocation class ] ] ) ifEmpty: [ nil ] ifNotEmpty: [:collection | collection first ] 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> receiver: aReceiver [
	^ self childrenNode add: aReceiver
]

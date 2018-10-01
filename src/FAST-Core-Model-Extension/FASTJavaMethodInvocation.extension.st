Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> arguments [
	<computed>
	<navigation: 'arguments'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableExpression class ]) 
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaMethodInvocation >> receiver [
	<computed>
	<navigation: 'receiver'>
	self flag: 'Bug same element with arguments'.
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableExpression class ]) at: 1 
]

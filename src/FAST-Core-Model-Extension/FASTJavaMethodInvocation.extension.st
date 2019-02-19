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
			({FASTVariableExpression.
			FASTNamedEntity.
			FASTLiteral.
			FASTJavaMethodInvocation.
			FASTJavaClassProperty.
			FASTJavaNewExpression.
			FASTJavaNewClassExpression.
			FASTJavaNewArray. }
				anySatisfy: [ :possibleClass | childNode isKindOf: possibleClass ])
				and: [ childNode ~= self receiver ] ]
]

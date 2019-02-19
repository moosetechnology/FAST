Extension { #name : #FASTJavaNewExpression }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewExpression >> addArgument: anArgument [
	childrenNode add: anArgument
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaNewExpression >> arguments [
	<computed>
	<navigation: 'arguments'>
	^ self childrenNode
		select: [ :childNode | 
			({FASTVariableExpression.
			FASTNamedEntity.
			FASTLiteral.
			FASTJavaMethodInvocation.
			FASTJavaClassProperty }
				anySatisfy: [ :possibleClass | childNode isKindOf: possibleClass ])
				and: [ childNode ~= self receiver ] ]
]

Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTExpressionStatement [
	<navigation: 'All FAST expression statement'>
	<package: #FAST>
	^ self allWithType: FASTExpressionStatement 
]

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTNamedBehaviouralEntity [
	<navigation: 'NamedBehaviouralEntity'>
	<package: #FAST>
	^ self allWithType: FASTNamedBehaviouralEntity 
]

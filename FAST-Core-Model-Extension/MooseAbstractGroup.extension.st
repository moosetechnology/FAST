Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTNamedBehaviouralEntity [
	<navigation: 'NamedBehaviouralEntity'>
	^ self allWithType: FASTNamedBehaviouralEntity 
]

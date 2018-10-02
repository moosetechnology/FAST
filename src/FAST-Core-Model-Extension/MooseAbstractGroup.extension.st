Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTJavaMethodEntity [
	<navigation: 'All FAST java method entity'>
	<package: #FAST>
	^ self allWithType: FASTJavaMethodEntity
]

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTNamedBehaviouralEntity [
	<navigation: 'NamedBehaviouralEntity'>
	<package: #FAST>
	^ self allWithType: FASTNamedBehaviouralEntity 
]

Extension { #name : #MooseAbstractGroup }

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTExpressionStatement [
	<navigation: 'All FAST expression statements'>
	<package: #FAST>
	^ self allUsing: FASTTExpressionStatement 
]

{ #category : #'*FAST-Core-Model-Extension' }
MooseAbstractGroup >> allFASTNamedBehaviouralEntity [
	<navigation: 'All FAST named behavioural entities'>
	<package: #FAST>
	^ self allUsing: FASTTNamedBehaviouralEntity 
]

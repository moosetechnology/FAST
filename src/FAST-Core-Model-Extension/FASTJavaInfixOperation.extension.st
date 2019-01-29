Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> leftOperand [
	<navigation: 'leftOperand'>
	^ (self childrenNode
		select: [ :childNode | childNode class = FASTJavaOperationLeftOperand ]) anyOne
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> leftOperand: aFASTJavaOperationLeftOperand [
	self childrenNode
		add:
			(FASTJavaOperationLeftOperand new
				addChild: aFASTJavaOperationLeftOperand;
				yourself).
				^ aFASTJavaOperationLeftOperand
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> rightOperand [
	<navigation: 'rightOperand'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaOperationRightOperand ]) at: 1 ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> rightOperand: aFASTJavaOperationRightOperand [
	self childrenNode
		add:
			(FASTJavaOperationRightOperand new
				addChild: aFASTJavaOperationRightOperand;
				yourself).
	^ aFASTJavaOperationRightOperand
]

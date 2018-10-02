Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> leftOperand [
	<navigation: 'leftOperand'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaOperationLeftOperand ]) at: 1
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> leftOperand: aFASTJavaOperationLeftOperand [
	^ self childrenNode add: aFASTJavaOperationLeftOperand
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> rightOperand [
	<navigation: 'rightOperand'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaOperationRightOperand ]) at: 1 ifAbsent: [ ^ nil ]
]

{ #category : #'*FAST-Core-Model-Extension' }
FASTJavaInfixOperation >> rightOperand: aFASTJavaOperationRightOperand [
	self childrenNode add: aFASTJavaOperationRightOperand
]
